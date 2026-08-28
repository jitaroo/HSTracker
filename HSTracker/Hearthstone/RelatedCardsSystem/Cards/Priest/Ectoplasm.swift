//
//  Ectoplasm.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Resummon all friendly minions that were slimed."
// Token created for both players by Slime 'em! ("Destroy all minions. Each player gets a 3-Cost
// spell that resummons theirs."). The board is snapshotted into Player.slimedMinions when Slime 'em!
// resolves, so this shows exactly what the holder's copy will bring back.
class Ectoplasm: ICardWithRelatedCards {
    required init() {}

    func getCardId() -> String {
        CardIds.NonCollectible.Priest.Slimeem_EctoplasmToken
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    // Duplicates are kept: two copies of a minion on board are two resummons.
    func getRelatedCards(player: Player) -> [Card?] {
        player.slimedMinions
            .compactMap { CardUtils.getProcessedCardFromEntity($0, player) }
            .sorted { $0.cost > $1.cost }
    }
}
