//
//  RelativeCostPoolCard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Where a relative-cost (evolve/devolve) effect finds the cards it transforms. Board
// sources use the entity's current cost tag (the game evolves from the current cost, so
// hand-time discounts carry over); hand and deck sources use the printed cost.
enum RelativeCostTargetSource {
    case friendlyBoard
    case enemyBoard
    case handCards
    case handMinions
    case handSpells
    case deckSpells
    case friendlyWeapon
}

// Ported from HDT's RelativeCostPoolCard.cs: base class for evolve/devolve-style cards -
// effects that transform (or summon off of) existing cards into random ones from the
// bucket of cards costing "target cost + costOffset".
//
// The related-cards list is the full pool (every possible outcome regardless of cost), so
// the user can browse and filter it in the pool panel. The summary, however, is
// conditioned on live game state: each current target contributes one draw from its own
// cost bucket, and the statistics are the resulting mixture. With no targets (e.g. empty
// board) the summary window still renders - headers and right-click hint only.
//
// Abstract - never registered with ReflectionHelper/RelatedCardsManager on its own, see
// abstractPoolBaseClassNames in ReflectionHelper.swift.
class RelativeCostPoolCard: ICardWithDynamicRelatedCardsSummary {
    required init() {
    }

    func getCardId() -> String {
        fatalError("Must override getCardId()")
    }

    /// Cost delta applied to each target: +1 for classic Evolve, -1 for Devolve, etc.
    var costOffset: Int {
        fatalError("Must override costOffset")
    }

    var targetSource: RelativeCostTargetSource { .friendlyBoard }

    /// True when the effect hits every candidate target at once (Evolve, Devolve). False
    /// when only one of the candidates is affected and we can't know which - targeted
    /// effects (Mutate), triggers (Bamboozle, Carefree Cookie). The summary then averages
    /// over the candidates instead of combining them.
    var affectsAllTargets: Bool { true }

    /// Draws per event: 1 for a random outcome, 3 for a discover-style pick.
    var batchSize: Int { 1 }

    var isWithReplacement: Bool { true }

    /// Which cards can be an outcome of the effect. Cost is handled by the bucketing, not here.
    func isInPool(_ card: Card) -> Bool { card.type == .minion }

    /// Cache discriminator for the shared pool. Subclasses with the same isInPool result must
    /// return the same key ("minions" default); override alongside isInPool ("spells", "weapons").
    var poolCacheKey: String { "minions" }

    func shouldShowForOpponent(opponent: Player) -> Bool { false }

    /// The full filtered pool. Cost-relative pools don't vary by the hovered entity (only the
    /// narrowing/bucketing does), so hoveredEntity is ignored here.
    func getPool(player: Player, hoveredEntity: Entity? = nil) -> [Card] {
        return getFilteredPool(player: player, gt: PoolContext.getGameType(), format: PoolContext.getFormatType())
    }

    func getRelatedCards(player: Player) -> [Card?] {
        return getRelatedCards(player: player, hoveredEntity: nil, pool: nil)
    }

    func getRelatedCards(player: Player, hoveredEntity: Entity?, pool: [Card]? = nil) -> [Card?] {
        return (pool ?? getPool(player: player, hoveredEntity: hoveredEntity)).map { $0 as Card? }
    }

    func computeSummary(player: Player, summary: inout [String: String]?, statistics: inout PoolStatistics?, usePercentages: Bool = true, hoveredEntity: Entity? = nil, pool: [Card]? = nil) -> Int {
        let pool = pool ?? getPool(player: player, hoveredEntity: hoveredEntity)

        let targets = getTargets(player: player, hoveredEntity: hoveredEntity)
        if !targets.isEmpty {
            var byCost = [Int: [Card]]()
            for card in pool {
                byCost[card.cost, default: []].append(card)
            }

            // One draw per target from its clamped cost bucket. Multiple targets resolving to
            // the same bucket merge into a draw count so the math treats them as repeats.
            var drawsPerCost = [Int: Int]()
            for (cost, offset) in targets {
                guard let bucket = RelativeCostPoolCard.resolveBucket(byCost: byCost, desired: cost + offset, offset: offset) else { continue }
                drawsPerCost[bucket, default: 0] += 1
            }

            if !drawsPerCost.isEmpty {
                let buckets = drawsPerCost.map { (pool: byCost[$0.key] ?? [], drawCount: $0.value) }
                let count = RelatedCardsManager.tryGetBucketedRelatedCardsSummary(
                    buckets: buckets, batchSize: batchSize, isWithReplacement: isWithReplacement, affectsAllTargets: affectsAllTargets,
                    result: &summary, statistics: &statistics, usePercentages: usePercentages)
                if count > 0 {
                    return count
                }
            }
        }

        summary = nil
        statistics = RelativeCostPoolCard.buildEmptyStatistics(pool: pool)
        return pool.count
    }

    /// The candidate targets as (cost, offset) pairs. The default pairs every card from
    /// targetSource with costOffset; override for effects with mixed directions or
    /// state-value pools that resolve to a single computed bucket.
    func getTargets(player: Player, hoveredEntity: Entity?) -> [(cost: Int, offset: Int)] {
        return RelativeCostPoolCard.getTargetCosts(player: player, source: targetSource).map { ($0, costOffset) }
    }

    /// The side-appropriate counter instance for `player`, or nil when the counter isn't
    /// running (e.g. non-traditional matches before initialization).
    static func getCounter<T: BaseCounter>(player: Player) -> T? {
        let game = AppDelegate.instance().coreManager.game
        let counters = player.isLocalPlayer ? game.counterManager.playerCounters : game.counterManager.opponentCounters
        return counters.first { $0 is T } as? T
    }

    /// The local player's currently available mana, including temporary mana (coins). Only
    /// meaningful for the local player - the summary is never computed for the opponent.
    static func remainingMana(player: Player) -> Int {
        let game = AppDelegate.instance().coreManager.game
        guard player.isLocalPlayer, let playerEntity = game.playerEntity else { return 0 }
        return playerEntity[.resources] + playerEntity[.temp_resources] - playerEntity[.resources_used]
    }

    /// The hovered entity's live cost when available (hand hovers), otherwise the printed
    /// cost of cardId (deck hovers).
    static func hoveredCost(hoveredEntity: Entity?, cardId: String) -> Int {
        if let hoveredEntity = hoveredEntity {
            return hoveredEntity[.cost]
        }
        return Cards.by(cardId: cardId)?.cost ?? 0
    }

    static func getTargetCosts(player: Player, source: RelativeCostTargetSource) -> [Int] {
        let game = AppDelegate.instance().coreManager.game
        switch source {
        case .friendlyBoard:
            return player.board.filter { $0.isMinion }.map { $0[.cost] }
        case .enemyBoard:
            return game.opponent.board.filter { $0.isMinion }.map { $0[.cost] }
        case .handCards:
            return player.hand.filter { $0.hasCardId }.map { $0.card.cost }
        case .handMinions:
            return player.hand.filter { $0.isMinion && $0.hasCardId }.map { $0.card.cost }
        case .handSpells:
            return player.hand.filter { $0.isSpell && $0.hasCardId }.map { $0.card.cost }
        case .deckSpells:
            // Approximation: the registered deck list rather than the exact remaining deck.
            let deck = player.isLocalPlayer ? player.playerCardList : player.opponentCardList
            return deck.filter { $0.type == .spell }.flatMap { card in Array(repeating: card.cost, count: max(1, card.count)) }
        case .friendlyWeapon:
            return player.board.filter { $0.isWeapon }.map { $0[.cost] }
        }
    }

    /// Maps a desired cost to the nearest non-empty bucket, mirroring the game's reroll
    /// behavior: clamp into the pool's cost range, then walk back toward the target's
    /// original cost (there are no 11+-cost minions, so evolving a 10-drop yields another
    /// 10-drop; devolving below the cheapest bucket yields the cheapest).
    static func resolveBucket(byCost: [Int: [Card]], desired: Int, offset: Int) -> Int? {
        guard let min = byCost.keys.min(), let max = byCost.keys.max(), min <= max else {
            return nil
        }

        var current = Swift.min(Swift.max(desired, min), max)
        let step = offset >= 0 ? -1 : 1
        while byCost[current] == nil {
            current += step
            if current < min || current > max {
                return nil
            }
        }
        return current
    }

    /// Per-player filter applied on top of the shared (class-agnostic) pool cache - a cheap
    /// pass recomputed per call. Override for pools with discover-style class scoping.
    func filterPoolForPlayer(_ pool: [Card], player: Player) -> [Card] {
        return pool
    }

    func getFilteredPool(player: Player, gt: GameType, format: FormatType) -> [Card] {
        let deck = player.isLocalPlayer ? player.playerCardList : player.opponentCardList

        // No self-exclusion, unlike DiscoverPoolCard: an evolve outcome can share a name
        // with its source (and spells-pool cards can produce themselves).
        let filtered = filterPoolForPlayer(getBasePool(gt: gt, format: format), player: player)
            .filterGenerationPool(deck: deck)
        var seenNames = Set<String>()
        // removes duplicated cards (for example core + expansion version)
        return filtered.filter { seenNames.insert($0.name).inserted }
    }

    // Full outcome pool per pool kind ("minions", "spells", "weapons") and (GameType,
    // FormatType). Evolve pools are class-agnostic (a 4-drop can evolve into any class's
    // 5-drop), so unlike DiscoverPoolCard's cache there is no player-class dimension and
    // all subclasses sharing a poolCacheKey share one entry.
    private static var sharedPoolCache = [String: [String: [Card]]]()

    private func getBasePool(gt: GameType, format: FormatType) -> [Card] {
        let key = "\(gt.rawValue)|\(format.rawValue)"
        if let cached = RelativeCostPoolCard.sharedPoolCache[poolCacheKey]?[key] {
            return cached
        }
        let basePool = Cards.collectible()
            .filter { isInPool($0) && $0.isCardLegal(gameType: gt, format: format) }
            .sorted { $0.cost < $1.cost }
        RelativeCostPoolCard.sharedPoolCache[poolCacheKey, default: [:]][key] = basePool
        return basePool
    }

    // Renders the summary window frame without content: section headers and em-dash
    // medians only. Attack/Health sections only appear for pools that contain minions.
    private static func buildEmptyStatistics(pool: [Card]) -> PoolStatistics {
        let hasMinions = pool.contains { $0.type != .spell }
        return PoolStatistics(
            medianCostText: "—",
            medianAttackText: hasMinions ? "—" : nil,
            medianHealthText: hasMinions ? "—" : nil,
            costBars: [],
            attackBars: hasMinions ? [] : nil,
            healthBars: hasMinions ? [] : nil)
    }
}
