//
//  BoardFill.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Number of empty board slots for each side, floored at 1 so the summary stays
// meaningful even at a full board.
struct BoardFill {
    private static let maxBoardSize = 7

    static var playerSlots: Int {
        return max(1, maxBoardSize - AppDelegate.instance().coreManager.game.playerBoardCount)
    }

    static var opponentSlots: Int {
        return max(1, maxBoardSize - AppDelegate.instance().coreManager.game.opponentBoardCount)
    }
}
