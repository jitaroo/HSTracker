//
//  MinionTypesPlayedThisGameCounter.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

// "Discover a minion with a type you haven't played." One entry is recorded per typed
// minion played, with every type it could count as (ALL expands to all types). The counter
// is the maximum matching between these entries and distinct types: the game always
// resolves multi-type minions in whichever way maximizes the count, so a Dragon/Mech alone
// counts 1, then flexes to the other type when a pure Dragon or Mech is played later (2),
// and a third minion of either type adds nothing.
class MinionTypesPlayedThisGameCounter: NumericCounter {
    static let minionTypes: [Race] = [
        .beast, .demon, .draenei, .dragon, .elemental, .mechanical,
        .murloc, .naga, .pirate, .quilboar, .totem, .undead
    ]

    override var localizedName: String {
        return String.localizedString("Counter_PlayedMinionTypes", comment: "")
    }

    override var cardIdToShowInUI: String? {
        return CardIds.Collectible.Neutral.TheOneAmalgamBand
    }

    override var relatedCards: [String] {
        return [
            CardIds.Collectible.Shaman.MountainMap,
            CardIds.Collectible.Shaman.SpiritOfTheMountain,
            CardIds.Collectible.Warrior.PowerSlider,
            CardIds.Collectible.Neutral.TheOneAmalgamBand
        ]
    }

    private var playedMinions: [(entityId: Int, types: [Race])] = []

    required init(controlledByPlayer: Bool, game: Game) {
        super.init(controlledByPlayer: controlledByPlayer, game: game)
    }

    override func shouldShow() -> Bool {
        guard game.isTraditionalHearthstoneMatch else { return false }
        if isPlayerCounter {
            return inPlayerDeckOrKnown(cardIds: relatedCards)
        }
        return counter > 1 && opponentMayHaveRelevantCards(ignoreNeutral: true)
    }

    override func getCardsToDisplay() -> [String] {
        return isPlayerCounter ?
            getCardsInDeckOrKnown(cardIds: relatedCards) :
            filterCardsByClassAndFormat(cardIds: relatedCards, playerClass: game.opponent.originalClass)
    }

    override var isDisplayValueLong: Bool { true }

    override func valueToShow() -> String {
        if counter == 0 {
            return String.localizedString("Counter_Spell_School_None", comment: "")
        }

        let matchedBy = buildMatching()
        let unplayed = getUnplayedTypes()
        let definite = matchedBy.keys
            .filter { !unplayed.contains($0) }
            .map { BattlegroundsMinionType.raceName($0) }
            .sorted()
        let flexible = matchedBy
            .filter { unplayed.contains($0.key) }
            .map { formatTypeSet(playedMinions[$0.value].types) }
            .sorted()
        return "\(counter) - \((definite + flexible).joined(separator: ", "))"
    }

    private func formatTypeSet(_ types: [Race]) -> String {
        if types.count == MinionTypesPlayedThisGameCounter.minionTypes.count {
            return BattlegroundsMinionType.raceName(.all)
        }
        return types.map { BattlegroundsMinionType.raceName($0) }.joined(separator: "/")
    }

    /// The minion types not yet locked into the current matching - still available as a
    /// Discover/pool candidate.
    func getUnplayedTypes() -> Set<Race> {
        let matchedBy = buildMatching()
        var unplayed = Set<Race>()
        for type in MinionTypesPlayedThisGameCounter.minionTypes {
            var copy = matchedBy
            var visited: Set<Race> = [type]
            if let holder = copy[type] {
                if tryAugment(holder, &visited, &copy) {
                    unplayed.insert(type)
                }
            } else {
                unplayed.insert(type)
            }
        }
        return unplayed
    }

    override func handleTagChange(tag: GameTag, entity: Entity, value: Int, prevValue: Int) {
        guard game.isTraditionalHearthstoneMatch else { return }
        guard entity.isControlled(by: isPlayerCounter ? game.player.id : game.opponent.id) else { return }
        guard entity.isMinion else { return }

        if tag == .cant_play && value > 0 && lastEntityToCount?.id == entity.id {
            if let last = playedMinions.lastIndex(where: { $0.entityId == entity.id }) {
                playedMinions.remove(at: last)
                counter = buildMatching().count
            }
            return
        }

        guard tag == .zone else { return }
        guard value == Zone.play.rawValue else { return }
        guard prevValue == Zone.hand.rawValue else { return }
        guard AppDelegate.instance().coreManager.logReaderManager.powerGameStateParser.currentBlock?.type == "PLAY" else { return }

        let types = MinionTypesPlayedThisGameCounter.getTypes(entity.latestCard)
        if types.isEmpty { return }

        playedMinions.append((entity.id, types))
        lastEntityToCount = entity
        counter = buildMatching().count
    }

    private static func getTypes(_ card: Card) -> [Race] {
        if card.isAllRace() {
            return minionTypes
        }
        return card.races.filter { minionTypes.contains($0) }
    }

    // Maximum bipartite matching (Kuhn's augmenting paths) between played minions and
    // types; sizes are tiny (<= 12 types), so recomputing per play is negligible.
    private func buildMatching() -> [Race: Int] {
        var matchedBy = [Race: Int]()
        for i in 0..<playedMinions.count {
            var visited = Set<Race>()
            _ = tryAugment(i, &visited, &matchedBy)
        }
        return matchedBy
    }

    private func tryAugment(_ minion: Int, _ visited: inout Set<Race>, _ matchedBy: inout [Race: Int]) -> Bool {
        for type in playedMinions[minion].types {
            if !visited.insert(type).inserted { continue }
            if matchedBy[type] == nil || tryAugment(matchedBy[type]!, &visited, &matchedBy) {
                matchedBy[type] = minion
                return true
            }
        }
        return false
    }
}
