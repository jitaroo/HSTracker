//
//  IKnowAGuyGANGS.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a Taunt minion. Give it +1/+2."
class IKnowAGuyGANGS: FrightenedFlunky {
    override func getCardId() -> String { CardIds.Collectible.Warrior.IKnowAGuyGANGS }
}

class IKnowAGuyCore: IKnowAGuyGANGS {
    override func getCardId() -> String { CardIds.Collectible.Warrior.IKnowAGuyCore }
}

class IKnowAGuyWONDERS: IKnowAGuyGANGS {
    override func getCardId() -> String { CardIds.Collectible.Warrior.IKnowAGuyWONDERS }
}
