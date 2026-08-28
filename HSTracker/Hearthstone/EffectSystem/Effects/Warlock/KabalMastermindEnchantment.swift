//
//  KabalMastermindEnchantment.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

class KabalMastermindEnchantment: EntityBasedEffect {
    override var cardId: String {
        return CardIds.NonCollectible.Warlock.KabalMastermind_ImpRovedImpFormantsEnchantment
    }

    override var cardIdToShowInUI: String {
        return CardIds.Collectible.Warlock.KabalMastermind
    }

    required init(entityId: Int, isControlledByPlayer: Bool) {
        super.init(entityId: entityId, isControlledByPlayer: isControlledByPlayer)
    }

    override var effectDuration: EffectDuration {
        return .permanent
    }

    override var effectTag: EffectTag {
        return .minionModification
    }
}
