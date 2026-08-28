//
//  PoolContext.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Resolves the game type and format a Discover/generation pool should be built
// for. HDT's PoolContext also extrapolates these from the deck-picker screen
// outside a match (so pool previews work before a game starts); nothing in
// HSTracker builds a pool preview there yet, so this only covers the in-game
// path for now. Add the menu-time fallback here (mirroring how
// Game.setDeckPickerState already threads VisualsFormatType into the mulligan
// pre-lobby view models) once something needs pools resolved outside a match.
struct PoolContext {
    static func getGameType() -> GameType {
        return AppDelegate.instance().coreManager.game.currentGameType
    }

    static func getFormatType() -> FormatType {
        return AppDelegate.instance().coreManager.game.currentFormatType
    }
}
