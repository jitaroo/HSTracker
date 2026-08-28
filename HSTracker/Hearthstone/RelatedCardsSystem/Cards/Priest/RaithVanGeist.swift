//
//  RaithVanGeist.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Battlecry: Resurrect your minions that were Reborn this game. They attack random enemy minions."
class RaithVanGeist: ICardWithRelatedCards {
    required init() {}

    func getCardId() -> String {
        CardIds.Collectible.Priest.RaithVanGeist
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    // HAS_BEEN_REBORN is stamped on the *new* entity the Reborn resummon creates, not on the minion that
    // died, so the pool cannot be read off dead minions: it would only list a minion once its reborn
    // copy had also died. Scan every entity instead - one HAS_BEEN_REBORN stamp per Reborn that resolved.
    func getRelatedCards(player: Player) -> [Card?] {
        return player.playerEntities
            .filter { $0.isMinion && $0.has(tag: .has_been_reborn) }
            .compactMap { CardUtils.getProcessedCardFromEntity($0, player) }
            .sorted { $0.cost > $1.cost }
    }
}
