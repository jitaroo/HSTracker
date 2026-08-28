//
//  DiscoverPoolCard.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// Ported from HDT's DiscoverPoolCard.cs: the shared base every
// RelatedCardsSystem/Cards/Pools generation-pool class (SpellPool, MinionPool,
// ClassOrNeutralCost3MinionPool, etc.) - and, through one of those, every
// individual card that draws from one of those pools - inherits. A leaf card
// only needs to override getCardId() (and picks()/eventCount()/
// isWithReplacement() when it isn't a standard 3-of-3 Discover); the pool
// classes override getCardPool(), and this base class does the actual
// filtering/caching/dedup work.
//
// Not itself registered with ReflectionHelper/RelatedCardsManager - see the
// abstractPoolBaseClassNames exclusion list in ReflectionHelper.swift, which
// this class and every Pools/ class need to be added to, the same way
// ResurrectionCard is excluded from the plain related-cards list.
//
// HDT shares one base-pool cache entry across every leaf card under the same
// pool-defining ancestor, found via reflection over which class actually
// declares GetCardPool. This port instead keys the cache by each leaf card's
// own runtime type: still correct (never stale, never cross-contaminated
// between different pools), just not shared between sibling cards of the same
// pool - a pure performance/redundancy difference (one cache miss per leaf
// card instead of per pool), not a behavioral one. Nothing in the ported
// Cards/Pools set actually depends on finer-grained sharing:
// GetPoolCacheVariant, HDT's other escape hatch for this, is declared but
// never overridden anywhere in HDT's own Cards/Pools either.
class DiscoverPoolCard: ICardWithRelatedCardsSummary {
    required init() {
    }

    func getCardId() -> String {
        fatalError("Must override getCardId()")
    }

    func picks() -> Int { 3 }
    func eventCount() -> Int { 1 }
    func isWithReplacement() -> Bool { false }
    func shouldShowForOpponent(opponent: Player) -> Bool { false }

    func getCardPool(playerClass: CardClass?, gt: GameType, format: FormatType) -> [Card] {
        fatalError("Must override getCardPool(playerClass:gt:format:)")
    }

    func isInLegalPool(_ card: Card, _ gt: GameType, _ format: FormatType) -> Bool {
        return card.isCardLegal(gameType: gt, format: format)
    }

    func filterPool(_ pool: [Card], _ deck: [Card]) -> [Card] {
        return pool.filterGenerationPool(deck: deck)
    }

    var useCardClassFallback: Bool { true }

    func getRelatedCards(player: Player) -> [Card?] {
        let gt = PoolContext.getGameType()
        let format = PoolContext.getFormatType()
        let deck = player.isLocalPlayer ? player.playerCardList : player.opponentCardList

        // Cards cannot generate themselves. Compared by name so reprints of the
        // generator (e.g. core vs expansion version) are excluded too.
        let selfName = Cards.by(cardId: getCardId())?.name

        // The base pool is pre-sorted by cost, and both steps below preserve
        // order, so the result comes out cost-sorted. Filtering must run before
        // the dedup so that the surviving copy of a name is always one the deck
        // can actually generate.
        let filtered = filterPool(getBasePool(player: player, gt: gt, format: format).filter { $0.name != selfName }, deck)
        var seenNames = Set<String>()
        let result = filtered.filter { seenNames.insert($0.name).inserted }

        return result
    }

    private func getBasePool(player: Player, gt: GameType, format: FormatType) -> [Card] {
        let playerClass = player.currentClass
        let basePool = getBasePoolForClass(playerClass, gt, format)
        if basePool.count > 0 || !useCardClassFallback {
            return basePool
        }

        // The game never offers an empty Discover: when nothing matches the player's
        // class it draws from the card's own class instead - a Mage holding Hive Map
        // (Demon Hunter, "Discover a Fel spell") is still offered Demon Hunter Fel
        // spells. Substituting the class rather than appending the card's class cards
        // keeps each pool's own class rule intact, so "class + Neutral" pools stay
        // "class + Neutral" around the substituted class.
        guard let fallbackClass, fallbackClass != playerClass else {
            return basePool
        }

        return getBasePoolForClass(fallbackClass, gt, format)
    }

    // The class the game falls back to when the player's class yields an empty
    // pool. Resolved once per instance from the card itself.
    private var fallbackClassResolved = false
    private var cachedFallbackClass: CardClass?
    private var fallbackClass: CardClass? {
        if !fallbackClassResolved {
            fallbackClassResolved = true
            let classes = Cards.by(cardId: getCardId())?.getClasses().filter { $0 != .neutral }
            cachedFallbackClass = classes?.count == 1 ? classes?.first : nil
        }
        return cachedFallbackClass
    }

    // Shared across every leaf card - see the class-level comment on why this
    // is keyed by runtime type rather than by pool-declaring ancestor.
    private static var sharedBasePoolCache = [String: [Card]]()

    private func getBasePoolForClass(_ playerClass: CardClass?, _ gt: GameType, _ format: FormatType) -> [Card] {
        let key = "\(String(describing: type(of: self)))|\(gt.rawValue)|\(format.rawValue)|\(playerClass?.rawValue ?? "")"
        if let cached = DiscoverPoolCard.sharedBasePoolCache[key] {
            return cached
        }
        let basePool = getCardPool(playerClass: playerClass, gt: gt, format: format)
            .filter { isInLegalPool($0, gt, format) }
            .sorted { $0.cost < $1.cost }
        DiscoverPoolCard.sharedBasePoolCache[key] = basePool
        return basePool
    }
}
