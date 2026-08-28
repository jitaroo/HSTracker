//
//  CardUtils.swift
//  HSTracker
//
//  Created by Francisco Moraes on 11/5/24.
//  Copyright © 2024 Benjamin Michotte. All rights reserved.
//

import Foundation

class CardUtils {
    static func isCardFromPlayerClass(card: Card, playerClass: CardClass?, ignoreNeutral: Bool = false) -> Bool {
        guard let playerClass else {
            return false
        }
        return (card.isClass(cardClass: playerClass) || card.getTouristVisitClass() == playerClass ||
             (!ignoreNeutral && card.playerClass == .neutral))
    }

    static func mayCardBeRelevant(card: Card, gameType: GameType, format: FormatType, playerClass: CardClass?, ignoreNeutral: Bool = false) -> Bool {
        return card.isCardLegal(gameType: gameType, format: format) && isCardFromPlayerClass(card: card, playerClass: playerClass, ignoreNeutral: ignoreNeutral)
    }

    // Ported from HDT's CardListExtensions.UngeneratableCards: cards that are never
    // actually offered by a Discover/generation effect despite being otherwise legal
    // (deck-rule legendaries, start-in-hand/start-of-game legendaries, Galakronds,
    // Tourists, and a couple of other special cases).
    private static let ungeneratableCards: Set<String> = [
        // Deck-rule legendaries
        CardIds.Collectible.Neutral.PrinceRenathal,
        CardIds.Collectible.Neutral.PrinceRenathalCorePlaceholder,
        CardIds.Collectible.Neutral.GennGreymane,
        CardIds.Collectible.Neutral.GennGreymaneCorePlaceholder,
        CardIds.Collectible.Neutral.BakuTheMooneater,
        CardIds.Collectible.Neutral.BakuTheMooneaterCorePlaceholder,
        CardIds.Collectible.Priest.DarkbishopBenedictus,
        CardIds.Collectible.Priest.DarkbishopBenedictusCorePlaceholder,
        CardIds.Collectible.Neutral.WhizbangTheWonderful,
        CardIds.Collectible.Neutral.SplendiferousWhizbang,
        CardIds.Collectible.Neutral.ZayleShadowCloak,
        // Start of Game / start-in-hand or -deck legendaries
        CardIds.Collectible.Neutral.NozdormuTheEternalCore,
        CardIds.Collectible.Neutral.ChogallTwilightChieftain,
        CardIds.Collectible.Neutral.PrinceMalchezaar,
        CardIds.Collectible.Rogue.MaestraOfTheMasquerade,
        CardIds.Collectible.DemonHunter.SouleatersScythe,
        CardIds.Collectible.Neutral.CthunTheShattered,
        CardIds.Collectible.Neutral.DragonSoulShattered,
        CardIds.Collectible.Druid.HamuulRunetotem,
        CardIds.Collectible.Warrior.SporeEmpressMoldara,
        // Galakronds
        CardIds.Collectible.Warlock.GalakrondTheWretched,
        CardIds.Collectible.Rogue.GalakrondTheNightmare,
        CardIds.Collectible.Shaman.GalakrondTheTempest,
        CardIds.Collectible.Warrior.GalakrondTheUnbreakable,
        CardIds.Collectible.Priest.GalakrondTheUnspeakable,
        // Tourists
        CardIds.Collectible.Rogue.MaestraMaskMerchant,
        CardIds.Collectible.Warrior.HammTheHungry,
        CardIds.Collectible.Hunter.RangerGilly,
        CardIds.Collectible.Mage.RayllaSandSculptor,
        CardIds.Collectible.Deathknight.Buttons,
        CardIds.Collectible.Shaman.CarefreeCookie,
        CardIds.Collectible.DemonHunter.ArannaThrillSeeker,
        CardIds.Collectible.Warlock.SummonerDarkmarrow,
        CardIds.Collectible.Paladin.SunsapperLynessa,
        CardIds.Collectible.Druid.MistahVistah,
        CardIds.Collectible.Priest.ChillinVoljin,
        CardIds.Collectible.Shaman.Turbulus,
        CardIds.Collectible.Mage.PortalmancerSkyla,
        // Other Non-generated
        CardIds.Collectible.Rogue.BounceAroundFtGarona,
        CardIds.Collectible.Rogue.SliceAndDice
    ]

    static func isAllowedInGenerationPool(
        _ card: Card,
        deckHasImbue: Bool,
        deckHasGalakrond: Bool,
        deckHasHerald: Bool,
        deckHasExcavate: Bool,
        deckHasZerg: Bool,
        deckHasTerran: Bool,
        deckHasProtoss: Bool
    ) -> Bool {
        if card.costBlood == 3 || card.costFrost == 3 || card.costUnholy == 3 {
            return false
        }

        if card.mechanics.contains("FABLED") || card.mechanics.contains("FABLED_PLUS") {
            return false
        }

        if card.mechanics.contains("COLOSSAL") || card.mechanics.contains("TITAN")
            || card.mechanics.contains("QUEST") || card.mechanics.contains("QUESTLINE") {
            return false
        }

        if card.mechanics.contains("SIDEBOARD_TYPE") || ungeneratableCards.contains(card.id) {
            return false
        }

        if card.mechanics.contains("IMBUE") && !deckHasImbue {
            return false
        }

        if card.mechanics.contains("GALAKROND") && !deckHasGalakrond {
            return false
        }

        if card.mechanics.contains("HERALD") && !deckHasHerald {
            return false
        }

        if card.mechanics.contains("EXCAVATE") && !deckHasExcavate {
            return false
        }

        if card.faction == .zerg && !deckHasZerg {
            return false
        }

        if card.faction == .terran && !deckHasTerran {
            return false
        }

        if card.faction == .protoss && !deckHasProtoss {
            return false
        }

        return true
    }

    private static let _starshipIds = [
        CardIds.NonCollectible.Neutral.ArkoniteDefenseCrystal_TheExilesHopeToken,
        CardIds.NonCollectible.Deathknight.ArkoniteDefenseCrystal_TheSpiritsPassageToken,
        CardIds.NonCollectible.DemonHunter.ArkoniteDefenseCrystal_TheLegionsBaneToken,
        CardIds.NonCollectible.Druid.ArkoniteDefenseCrystal_TheCelestialArchiveToken,
        CardIds.NonCollectible.Hunter.ArkoniteDefenseCrystal_TheAstralCompassToken,
        CardIds.NonCollectible.Rogue.ArkoniteDefenseCrystal_TheScavengersWillToken,
        CardIds.NonCollectible.Warlock.ArkoniteDefenseCrystal_TheNethersEyeToken,
        CardIds.NonCollectible.Invalid.BattlecruiserToken
    ]

    public static func isStarship(_ cardId: String) -> Bool {
        return _starshipIds.contains(cardId)
    }
        
    static func getProcessedCardFromEntity(_ entity: Entity, _ player: Player) -> Card? {
        // LatestCardId, not CardId: the entity may have transformed in place (e.g. Hex via CHANGE_ENTITY)
        let cardId = entity.info.latestCardId
        if isStarship(cardId) {
            return entity.handleStarship(player)
        }
        let card = Cards.by(cardId: cardId)
        return card?.handleZilliax3000(player: player)
    }
}

extension Entity {
    func handleStarship(_ player: Player) -> Card? {
        // Clone the card and get the starship pieces
        let card = card.copy()

        let starshipPieces = info.storedCardIds
            .compactMap { Cards.by(cardId: $0) }

        // Create a set of mechanics from all the starship pieces
        var mechanics = Set<String>()
        for piece in starshipPieces {
            for mechanic in piece.mechanics {
                mechanics.insert(mechanic)
            }
        }

        // Set the mechanics, stats, and cost
        card.mechanics = mechanics.compactMap { $0 }
        card.attack = starshipPieces.reduce(0, { $0 + $1.attack })
        card.health = starshipPieces.reduce(0, { $0 + $1.health })
        card.cost = max(10, starshipPieces.reduce(0, { $0 + $1.cost }))

        return card
    }
}

extension Card {
    func handleZilliax3000(player: Player) -> Card? {
        if id.starts(with: CardIds.Collectible.Neutral.ZilliaxDeluxe3000) {
            if let sideboard = player.playerSideboardsDict.first(where: { $0.ownerCardId == CardIds.Collectible.Neutral.ZilliaxDeluxe3000 }),
               sideboard.cards.count > 0 {
                let cosmetic = sideboard.cards.first { !$0.zilliaxCustomizableFunctionalModule }
                let modules = sideboard.cards.filter { $0.zilliaxCustomizableFunctionalModule }

                // Clone Zilliax with new cost, attack, health, and mechanics
                let newCard = cosmetic?.copy() ?? copy()
                var mechanics: [String] = []
                
                for module in modules where module.mechanics.count > 0 {
                    mechanics.append(contentsOf: module.mechanics)
                }
                
                newCard.mechanics = mechanics
                newCard.attack = modules.reduce(0) { $0 + $1.attack }
                newCard.health = modules.reduce(0) { $0 + $1.health }
                newCard.cost = modules.reduce(0) { $0 + $1.cost }
                
                return newCard
            }
        }
        
        return self
    }
    
    func hasDeathrattle() -> Bool {
        return mechanics.contains("DEATHRATTLE")
    }
    
    func hasTaunt() -> Bool {
        return mechanics.contains("TAUNT")
    }

    // Optional-accepting overload for Cards/Pools generation-pool filters, which
    // compare against a possibly-unknown player class (e.g. in the menu, or the
    // opponent's class before it's revealed).
    func isClass(cardClass: CardClass?) -> Bool {
        guard let cardClass else { return false }
        return isClass(cardClass: cardClass)
    }

    // Ported from HDT's recurring `c.IsClass(playerClass) || c.IsClass("Neutral")`
    // pattern used throughout Cards/Pools/ClassOrNeutral*.
    func isClassOrNeutral(_ playerClass: CardClass?) -> Bool {
        return isClass(cardClass: .neutral) || isClass(cardClass: playerClass)
    }
}

extension Array where Element: Card {
    func filterCardsByFormat(gameType: GameType, format: FormatType) -> [Card] {
        return filter { $0.isCardLegal(gameType: gameType, format: format) }
    }

    func filterCardsByPlayerClass(playerClass: CardClass?, ignoreNeutral: Bool = false) -> [Card] {
        return filter { CardUtils.isCardFromPlayerClass(card: $0, playerClass: playerClass, ignoreNeutral: ignoreNeutral) }
    }

    // Ported from HDT's CardListExtensions.FilterGenerationPool: some cards are only
    // available in generation pools (Discover, random summon/cast) if the deck has
    // some requirement, such as running Imbue or a specific Galakrond.
    func filterGenerationPool(deck: [Card]) -> [Card] {
        let deckHasImbue = deck.contains { $0.mechanics.contains("IMBUE") }
        let deckHasGalakrond = deck.contains { $0.mechanics.contains("GALAKROND") }
        let deckHasHerald = deck.contains { $0.mechanics.contains("HERALD") }
        let deckHasExcavate = deck.contains { $0.mechanics.contains("EXCAVATE") }
        let deckHasZerg = deck.contains { $0.faction == .zerg }
        let deckHasTerran = deck.contains { $0.faction == .terran }
        let deckHasProtoss = deck.contains { $0.faction == .protoss }

        return filter { card in
            CardUtils.isAllowedInGenerationPool(
                card,
                deckHasImbue: deckHasImbue,
                deckHasGalakrond: deckHasGalakrond,
                deckHasHerald: deckHasHerald,
                deckHasExcavate: deckHasExcavate,
                deckHasZerg: deckHasZerg,
                deckHasTerran: deckHasTerran,
                deckHasProtoss: deckHasProtoss
            )
        }
    }
}
