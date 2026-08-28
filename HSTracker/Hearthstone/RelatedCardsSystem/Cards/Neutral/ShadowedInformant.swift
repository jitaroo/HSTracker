//
//  ShadowedInformant.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Discover a {0} spell. (Swaps class each turn!)" The class it currently
// discovers from is on the entity's tag_script_data_num_1 (a CardClass value). With no tag
// - deck-list hovers, tag not yet set - it falls back to the player's own class. The pool
// varies by class rather than cost, so this implements ICardWithDynamicRelatedCardsSummary
// directly instead of extending RelativeCostPoolCard.
class ShadowedInformant: ICardWithDynamicRelatedCardsSummary {
    required init() {
    }

    // Class-scoped spell pools per (class, GameType, FormatType); deck-dependent filtering
    // and name-dedup are cheap single passes recomputed per call.
    private static var poolCache = [String: [Card]]()

    func getCardId() -> String { CardIds.Collectible.Neutral.ShadowedInformant }

    func shouldShowForOpponent(opponent: Player) -> Bool { false }

    // The pool itself varies by the discovered class, which is read off the hovered
    // entity's tag (or the in-hand copy's when none is passed), so hoveredEntity is
    // honoured here.
    func getPool(player: Player, hoveredEntity: Entity? = nil) -> [Card] {
        return getFilteredPool(player: player, className: discoverClass(player: player, hoveredEntity: hoveredEntity))
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

    // The hand grid comes from getRelatedCards, which never receives the hovered entity, so
    // with no entity the in-hand copy's tag is looked up by card id.
    private func discoverClass(player: Player, hoveredEntity: Entity?) -> CardClass? {
        let tag = hoveredEntity?[.tag_script_data_num_1]
            ?? player.hand.first(where: { $0.cardId == getCardId() })?[.tag_script_data_num_1]
            ?? 0
        return tag > 0 ? TagClass(rawValue: tag)?.cardClassValue : player.currentClass
    }

    private func getFilteredPool(player: Player, className: CardClass?) -> [Card] {
        let gt = PoolContext.getGameType()
        let format = PoolContext.getFormatType()
        let key = "\(className?.rawValue ?? "")|\(gt.rawValue)|\(format.rawValue)"
        var pool = ShadowedInformant.poolCache[key]
        if pool == nil {
            pool = Cards.collectible()
                .filter { $0.type == .spell && $0.isClass(cardClass: className) }
                .filter { $0.isCardLegal(gameType: gt, format: format) }
                .sorted { $0.cost < $1.cost }
            ShadowedInformant.poolCache[key] = pool
        }

        let deck = player.isLocalPlayer ? player.playerCardList : player.opponentCardList
        var seenNames = Set<String>()
        return (pool ?? [])
            .filterGenerationPool(deck: deck)
            .filter { seenNames.insert($0.name).inserted }
    }
}
