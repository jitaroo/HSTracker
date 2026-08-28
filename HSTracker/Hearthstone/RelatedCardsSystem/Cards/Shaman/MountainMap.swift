//
//  MountainMap.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a minion with a type you haven't played. If you play it this turn, also pick
// one of the others." The pool shrinks as MinionTypesPlayedThisGameCounter fills up: a type
// stays in the pool while a minion of it could still raise the counter (the maximizing rule
// keeps ambiguous dual-types available), and ALL-type minions always qualify. The pool
// varies with live counter state, so this implements ICardWithDynamicRelatedCardsSummary
// directly instead of extending DiscoverPoolCard.
class MountainMap: ICardWithDynamicRelatedCardsSummary {
    required init() {
    }

    // Typed-minion pools per (class, GameType, FormatType); the per-state filtering by
    // unplayed types and deck-dependent passes are cheap and recomputed per call.
    private static var poolCache = [String: [Card]]()

    func getCardId() -> String { CardIds.Collectible.Shaman.MountainMap }

    func shouldShowForOpponent(opponent: Player) -> Bool { false }

    // Pool depends on live counter state and class, not the hovered entity, so it is ignored.
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
        return RelatedCardsManager.tryGetRelatedCardsSummary(relatedCards: poolList, pickConfig: PickConfig(batchSize: 3, eventCount: 1, isWithReplacement: false), result: &summary, statistics: &statistics, usePercentages: usePercentages)
    }

    private func getFilteredPool(player: Player) -> [Card] {
        let gt = PoolContext.getGameType()
        let format = PoolContext.getFormatType()
        let playerClass = player.currentClass
        let key = "\(playerClass?.rawValue ?? "")|\(gt.rawValue)|\(format.rawValue)"
        var pool = MountainMap.poolCache[key]
        if pool == nil {
            pool = Cards.collectible()
                .filter { $0.type == .minion && $0.isClassOrNeutral(playerClass) && !$0.isEmptyRace() }
                .filter { $0.isCardLegal(gameType: gt, format: format) }
                .sorted { $0.cost < $1.cost }
            MountainMap.poolCache[key] = pool
        }

        let unplayed = MountainMap.getUnplayedTypes(player: player)
        let deck = player.isLocalPlayer ? player.playerCardList : player.opponentCardList
        var seenNames = Set<String>()
        return (pool ?? [])
            .filter { MountainMap.hasUnplayedType($0, unplayed) }
            .filterGenerationPool(deck: deck)
            .filter { seenNames.insert($0.name).inserted }
    }

    private static func getUnplayedTypes(player: Player) -> Set<Race> {
        guard let counter: MinionTypesPlayedThisGameCounter = RelativeCostPoolCard.getCounter(player: player) else {
            return Set(MinionTypesPlayedThisGameCounter.minionTypes)
        }
        return counter.getUnplayedTypes()
    }

    private static func hasUnplayedType(_ card: Card, _ unplayed: Set<Race>) -> Bool {
        return card.isAllRace() || card.races.contains { unplayed.contains($0) }
    }
}
