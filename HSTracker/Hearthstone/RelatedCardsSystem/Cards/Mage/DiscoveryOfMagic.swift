//
//  DiscoveryOfMagic.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a spell from a spell school you haven't cast this game (from any class)." The
// pool shrinks as PlayedSpellSchoolsCounter fills up: a spell stays only while its school
// hasn't been cast. Cross-class ("from any class"). Varies with live counter state, so this
// implements ICardWithDynamicRelatedCardsSummary directly (cf. MountainMap).
class DiscoveryOfMagic: ICardWithDynamicRelatedCardsSummary {
    required init() {
    }

    // All schooled spells (cross-class) per (GameType, FormatType); the per-state filtering
    // by unplayed school and deck-dependent pass are cheap and recomputed per call.
    private static var poolCache = [String: [Card]]()

    func getCardId() -> String { CardIds.Collectible.Mage.DiscoveryOfMagic }

    // Discover: 3 unique choices, single event.
    var config: PickConfig { PickConfig(batchSize: 3, eventCount: 1, isWithReplacement: false) }

    func shouldShowForOpponent(opponent: Player) -> Bool { false }

    // Pool depends on live counter state, not the hovered entity, so hoveredEntity is ignored.
    func getPool(player: Player, hoveredEntity: Entity? = nil) -> [Card] {
        return getFilteredPool(player: player)
    }

    func getRelatedCards(player: Player) -> [Card?] {
        return getRelatedCards(player: player, hoveredEntity: nil, pool: nil)
    }

    func getRelatedCards(player: Player, hoveredEntity: Entity?, pool: [Card]? = nil) -> [Card?] {
        return (pool ?? getPool(player: player, hoveredEntity: hoveredEntity)).map { $0 as Card? }
    }

    func computeSummary(player: Player, summary: inout [String: String]?, statistics: inout PoolStatistics?, usePercentages: Bool = true, hoveredEntity: Entity? = nil, pool: [Card]? = nil) -> Int {
        let poolList = (pool ?? getPool(player: player, hoveredEntity: hoveredEntity)).map { $0 as Card? }
        return RelatedCardsManager.tryGetRelatedCardsSummary(relatedCards: poolList, pickConfig: config, result: &summary, statistics: &statistics, usePercentages: usePercentages)
    }

    private func getFilteredPool(player: Player) -> [Card] {
        let gt = PoolContext.getGameType()
        let format = PoolContext.getFormatType()
        let key = "\(gt.rawValue)|\(format.rawValue)"
        var pool = DiscoveryOfMagic.poolCache[key]
        if pool == nil {
            pool = Cards.collectible()
                .filter { $0.type == .spell && $0.spellSchool != .none }
                .filter { $0.isCardLegal(gameType: gt, format: format) }
                .sorted { $0.cost < $1.cost }
            DiscoveryOfMagic.poolCache[key] = pool
        }

        let played = DiscoveryOfMagic.getPlayedSchools(player: player)
        let deck = player.isLocalPlayer ? player.playerCardList : player.opponentCardList
        var seenNames = Set<String>()
        return (pool ?? [])
            .filter { !played.contains($0.spellSchool) }
            .filterGenerationPool(deck: deck)
            .filter { seenNames.insert($0.name).inserted }
    }

    private static func getPlayedSchools(player: Player) -> Set<SpellSchool> {
        guard let counter: PlayedSpellSchoolsCounter = RelativeCostPoolCard.getCounter(player: player) else {
            return Set<SpellSchool>()
        }
        return counter.getPlayedSpellSchools()
    }
}
