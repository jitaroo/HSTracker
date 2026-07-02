//
//  SnapshotBuilder.swift
//  HSTracker
//
//  BACONBRAIN: pure Game -> BaconbrainKit.GameSnapshot mapping (BRS §3, §4.1).
//  See PLAN-phase0.md §8 for BRS-vs-source corrections applied here (shop zone, dbfId lookups,
//  trinket-kind heuristic, HSReplay raw taps, etc).
//

import BaconbrainKit
import Foundation

enum SnapshotBuilder {
    /// The fork tracks upstream feature branch "36.0" (see CHANGELOG); there is no runtime source
    /// for a dotted patch string (Game.buildNumber is an opaque integer). Revisit when the Phase 3
    /// KB version guard needs real precision (PLAN-phase0.md §8).
    static let gamePatch = "36.0"

    static func build(game: Game, ctx: ExporterContext) -> GameSnapshot? {
        guard game.isBattlegroundsSoloMatch(), !game.gameId.isEmpty else { return nil }

        let phase = currentPhase(game: game)
        let pe = game.playerEntity
        let hero = game.player.hero

        let goldCurrent = (pe?[.resources] ?? 0) + (pe?[.temp_resources] ?? 0) - (pe?[.resources_used] ?? 0)
        let goldMax = pe?[.resources] ?? 0

        let shopEntities = liveShopEntities(game: game, phase: phase)

        let heroCardId = hero.map { BattlegroundsUtils.getOriginalHeroId(heroId: $0.cardId, mapKelthuzad: true) } ?? ""
        let heroName = hero?.card.name ?? ""
        let heroPowerText = game.player.board.first { $0.isHeroPower }?.card.formattedText() ?? ""

        let heroesOffered: [HeroOption]
        if phase == .heroPick {
            heroesOffered = game.player.playerEntities
                .filter {
                    $0.isHero
                        && ($0.has(tag: .bacon_hero_can_be_drafted) || $0.has(tag: .bacon_skin))
                        && !$0.has(tag: .bacon_locked_mulligan_hero)
                }
                .sorted { $0.zonePosition < $1.zonePosition }
                .map { entity in
                    HeroOption(
                        cardId: entity.cardId,
                        name: entity.card.name,
                        heroPower: Cards.by(dbfId: entity[.hero_power], collectible: false)?.formattedText() ?? ""
                    )
                }
        } else {
            heroesOffered = []
        }

        let board = mapMinions(game.player.board.filter { $0.isMinion }, game: game)
        let hand = mapMinions(game.player.hand.filter { $0.isMinion || $0.isBattlegroundsSpell }, game: game)
        let shop = mapMinions(shopEntities, game: game)

        let trinketsActive = game.player.trinkets.map { trinket(from: $0, ctx: ctx) }
        let trinketsOffered = ctx.offeredTrinketEntityIds
            .compactMap { game.entities[$0] }
            .map { trinket(from: $0, ctx: ctx) }

        let anomaly = BattlegroundsUtils.getBattlegroundsAnomalyDbfId(game: game.gameEntity)
            .flatMap { Cards.by(dbfId: $0, collectible: false)?.name }

        let activeTribes = (game.availableRaces ?? []).compactMap(tribe(from:))

        let nextOpponentPlayerId: Int? = {
            guard let entity = game.entities.values.first(where: { $0.has(tag: .next_opponent_player_id) }) else {
                return nil
            }
            let value = entity[.next_opponent_player_id]
            return value == 0 ? nil : value
        }()

        return GameSnapshot(
            schemaVersion: 1,
            gamePatch: gamePatch,
            gameId: game.gameId,
            turn: game.turnNumber(),
            phase: phase,
            goldCurrent: goldCurrent,
            goldMax: goldMax,
            tavernTier: hero?[.player_tech_level] ?? 1,
            tavernUpCost: buttonCost(game: game, prefix: "TB_BaconShopTechUp"),
            rerollCost: buttonCost(game: game, prefix: "TB_BaconShop_8p_Reroll"),
            shopFrozen: shopEntities.contains { $0.has(tag: .frozen) },
            anomaly: anomaly,
            activeTribes: activeTribes,
            playerHealth: hero?.health ?? 0,
            playerArmor: hero?[.armor] ?? 0,
            heroCardId: heroCardId,
            heroName: heroName,
            heroPower: heroPowerText,
            heroesOffered: heroesOffered,
            board: board,
            hand: hand,
            shop: shop,
            trinketsActive: trinketsActive,
            trinketsOffered: trinketsOffered,
            combatPrediction: ctx.lastCombatPrediction,
            nextOpponentPlayerId: nextOpponentPlayerId,
            hsreplay: mapHSReplay(ctx: ctx),
            opponents: mapOpponents(game: game)
        )
    }

    // MARK: - Phase

    private static func currentPhase(game: Game) -> Phase {
        if game.gameEntity?[.step] == Step.begin_mulligan.rawValue {
            return .heroPick
        }
        if game.isBattlegroundsCombatPhase {
            return .combat
        }
        return .recruit
    }

    // MARK: - Shop
    // BRS §4.1 CORRECTION (PLAN-phase0.md §8): no "shop zone" or live-shop overlay source exists.
    // During recruit the shop is Bob's (the opponent's) play-zone board.

    private static func liveShopEntities(game: Game, phase: Phase) -> [Entity] {
        guard phase == .recruit else { return [] }
        return game.entities.values
            .filter {
                ($0.isMinion || $0.isBattlegroundsSpell)
                    && $0.isInZone(zone: .play)
                    && $0.isControlled(by: game.opponent.id)
            }
            .sorted { $0.zonePosition < $1.zonePosition }
    }

    // MARK: - Minion mapping

    private static let keywordTags: [(GameTag, String)] = [
        (.taunt, "TAUNT"),
        (.divine_shield, "DIVINE_SHIELD"),
        (.poisonous, "POISONOUS"),
        (.venomous, "VENOMOUS"),
        (.windfury, "WINDFURY"),
        (.mega_windfury, "MEGA_WINDFURY"),
        (.reborn, "REBORN"),
        (.stealth, "STEALTH")
    ]

    private static func mapMinions(_ entities: [Entity], game: Game) -> [Minion] {
        entities
            .sorted { $0.zonePosition < $1.zonePosition }
            .map { entity in
                let keywords = keywordTags.filter { entity.has(tag: $0.0) }.map { $0.1 }
                let enchantments = game.entities.values
                    .filter { $0.isAttachedTo(entityId: entity.id) && $0.isEnchantment }
                    .map { $0.card.name }
                return Minion(
                    id: entity.id,
                    cardId: entity.cardId,
                    name: entity.card.name,
                    attack: entity.attack,
                    health: entity.health,
                    tribes: entity.card.races.compactMap(tribe(from:)),
                    tier: entity.card.techLevel,
                    golden: entity[.premium] > 0,
                    keywords: keywords,
                    enchantments: enchantments,
                    pos: entity.zonePosition - 1
                )
            }
    }

    private static func tribe(from race: Race) -> Tribe? {
        switch race {
        case .beast: return .beast
        case .mechanical: return .mech
        case .murloc: return .murloc
        case .demon: return .demon
        case .dragon: return .dragon
        case .elemental: return .elemental
        case .naga: return .naga
        case .undead: return .undead
        case .quilboar: return .quilboar
        case .pirate: return .pirate
        case .all: return .all
        default: return nil
        }
    }

    // MARK: - Trinkets
    // DECISION (no BRS answer; PLAN-phase0.md §8): no lesser/greater tag exists on trinket
    // entities. Kind is inferred from the per-game offer ordinal cached in ExporterContext
    // (1st offer = lesser, 2nd = greater), defaulting to .lesser.

    private static func trinket(from entity: Entity, ctx: ExporterContext) -> Trinket {
        Trinket(
            cardId: entity.cardId,
            name: entity.card.name,
            kind: ctx.kind(forCardId: entity.cardId),
            goldCost: entity[.cost],
            text: entity.card.formattedText()
        )
    }

    // MARK: - Opponent boards (hook k: Game.baconbrainBoardSnapshots)

    private static func mapOpponents(game: Game) -> [OpponentBoard] {
        let selfPlayerId = game.player.hero?[.player_id]
        return game.baconbrainBoardSnapshots.compactMap { playerId, snapshot -> OpponentBoard? in
            if let selfPlayerId, playerId == selfPlayerId { return nil }
            let liveHero = game.entities.values.first {
                $0.isHero && $0[.player_id] == playerId && ($0.isInSetAside || $0.isInPlay)
            }
            return OpponentBoard(
                playerId: playerId,
                heroName: liveHero?.card.name ?? "",
                health: liveHero?.health ?? 0,
                armor: liveHero?[.armor] ?? 0,
                lastSeenBoardTurn: snapshot.turn,
                board: mapMinions(snapshot.entities, game: game),
                tavernTier: liveHero?[.player_tech_level] ?? 0
            )
        }
    }

    // MARK: - HSReplay caches (hooks f/h/i; the exporter never issues requests — BRS §9)

    private static func mapHSReplay(ctx: ExporterContext) -> HSReplayBlock {
        let comps = ctx.comps?.map { comp -> CompRow in
            CompRow(
                name: comp.name ?? "Comp \(comp.id)",
                keyMinionsTop3: (comp.key_minions_top3 ?? []).map(cardId(fromDbfId:)),
                popularity: comp.popularity,
                avgFinalPlacement: comp.avg_final_placement
            )
        }

        let heroPick = ctx.heroPickStats?.map { stat -> HeroPickRow in
            let card = Cards.by(dbfId: stat.hero_dbf_id, collectible: false)
            let topComps = stat.first_place_comp_popularity?
                .filter { $0.is_valid }
                .map { comp -> CompRow in
                    CompRow(
                        name: comp.name,
                        keyMinionsTop3: comp.key_minions_top3.map(cardId(fromDbfId:)),
                        popularity: comp.popularity,
                        // BattlegroundsComposition carries no placement figure; documented sentinel
                        // (PLAN-phase0.md §8) since CompRow requires the field.
                        avgFinalPlacement: 0.0
                    )
                }
            return HeroPickRow(
                cardId: card?.id ?? String(stat.hero_dbf_id),
                name: card?.name ?? "Hero \(stat.hero_dbf_id)",
                tierV2: stat.tier_v2,
                avgPlacement: stat.avg_placement,
                pickRate: stat.pick_rate,
                placementDistribution: stat.placement_distribution,
                topComps: topComps
            )
        }

        let trinketPick = ctx.trinketPickStats?.map { stat -> TrinketPickRow in
            let card = Cards.by(dbfId: stat.trinket_dbf_id, collectible: false)
            return TrinketPickRow(
                cardId: card?.id ?? String(stat.trinket_dbf_id),
                name: card?.name ?? "Trinket \(stat.trinket_dbf_id)",
                avgPlacement: stat.avg_placement ?? 0
            )
        }

        let available = (comps?.isEmpty == false) || (heroPick?.isEmpty == false) || (trinketPick?.isEmpty == false)
        return HSReplayBlock(heroPick: heroPick, comps: comps, trinketPick: trinketPick, available: available)
    }

    private static func cardId(fromDbfId dbfId: Int) -> String {
        Cards.by(dbfId: dbfId, collectible: false)?.id ?? String(dbfId)
    }

    // MARK: - Best-effort shop button costs
    // No lesser/greater... err, no tech-up/reroll button entity was found anywhere in the fork
    // source (PLAN-phase0.md §8/§3.1): this scans live player entities for a matching cardId
    // prefix and never blocks the emit when nothing matches.

    private static func buttonCost(game: Game, prefix: String) -> Int? {
        guard let entity = game.player.playerEntities.first(where: { $0.cardId.hasPrefix(prefix) }) else {
            return nil
        }
        return entity[.cost]
    }
}
