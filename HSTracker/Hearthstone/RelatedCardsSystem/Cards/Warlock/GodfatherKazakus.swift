//
//  GodfatherKazakus.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

class GodfatherKazakus: ICardWithRelatedCards {
    private static let trialOptions: [String] = [
        CardIds.NonCollectible.Warlock.GodfatherKazakus_TonicOfTyrannyToken,
        CardIds.NonCollectible.Warlock.GodfatherKazakus_ConvictedForConspiracyToken,
        CardIds.NonCollectible.Warlock.GodfatherKazakus_SentencedForSmugglingToken,
        CardIds.NonCollectible.Warlock.GodfatherKazakus_CrateOfContrabandToken,
        CardIds.NonCollectible.Warlock.GodfatherKazakus_SpuriousShivToken,
        CardIds.NonCollectible.Warlock.GodfatherKazakus_CriminalContractToken,
        CardIds.NonCollectible.Warlock.GodfatherKazakus_PotionOfPerjuryToken,
        CardIds.NonCollectible.Warlock.GodfatherKazakus_SwillOfSuggestibilityToken,
        CardIds.NonCollectible.Warlock.GodfatherKazakus_DetainedForDestructionToken
    ]

    required init() {}

    func getCardId() -> String {
        CardIds.Collectible.Warlock.GodfatherKazakus
    }

    func shouldShowForOpponent(opponent: Player) -> Bool {
        false
    }

    func getRelatedCards(player: Player) -> [Card?] {
        GodfatherKazakus.trialOptions.map { Cards.any(byId: $0) }
    }
}
