//
//  ReflectionHelper.swift
//  HSTracker
//
//  Created by Francisco Moraes on 11/4/24.
//  Copyright © 2024 Benjamin Michotte. All rights reserved.
//

import Foundation

class ReflectionHelper {
    // RelatedCardsSystem/DiscoverPoolCard.swift and every RelatedCardsSystem/Cards/Pools
    // class (e.g. SpellPool, ClassOrNeutralCost3MinionPool) are abstract pool-definition
    // base classes, never meant to be instantiated as a "card" on their own - only their
    // own further (leaf card) subclasses are. HDT's C# reflection excludes these
    // automatically via `!t.IsAbstract`; Swift has no such runtime flag, so they're
    // named here instead, the same way ResurrectionCard is excluded below for a
    // different reason. A few (FireSpellPool, MageSecretPool, ShadowSpellPool) also
    // conform to ICardGenerator and need excluding from that sweep too.
    private static let abstractPoolBaseClassNames: Set<String> = [
        "DiscoverPoolCard", "FromThePastPoolCard",
        "RelativeCostPoolCard", "StateValuePoolCard", "AnimalCompanionUpgradeCard",
        "Attack468BeastMinionPool", "BeastMinionPool",
        "ClassOrNeutralBattlecryMinionPool", "ClassOrNeutralBeastMinionPool", "ClassOrNeutralCardPool",
        "ClassOrNeutralChooseOneCardPool", "ClassOrNeutralCost1CardPool", "ClassOrNeutralCost1MinionPool",
        "ClassOrNeutralCost2CardPool", "ClassOrNeutralCost3CardPool", "ClassOrNeutralCost3MinionPool",
        "ClassOrNeutralCost4CardPool", "ClassOrNeutralCost5CardPool", "ClassOrNeutralCost5MinionPool",
        "ClassOrNeutralCost6MinionPool", "ClassOrNeutralCost8MinionPool", "ClassOrNeutralCostAtLeast5MinionPool",
        "ClassOrNeutralCostAtLeast5SpellPool", "ClassOrNeutralCostAtLeast8MinionPool", "ClassOrNeutralCostAtMost3SpellPool",
        "ClassOrNeutralDeathrattleCardPool", "ClassOrNeutralDeathrattleMinionPool", "ClassOrNeutralDemonMinionPool",
        "ClassOrNeutralDragonMinionPool", "ClassOrNeutralElementalMinionPool", "ClassOrNeutralFelSpellPool",
        "ClassOrNeutralLegendaryMinionPool", "ClassOrNeutralMechMinionPool", "ClassOrNeutralNagaMinionPool",
        "ClassOrNeutralNatureSpellPool", "ClassOrNeutralPirateMinionPool", "ClassOrNeutralSecretPool",
        "ClassOrNeutralSpellPool", "ClassOrNeutralStealthMinionPool", "ClassOrNeutralTauntMinionPool",
        "ClassOrNeutralUndeadMinionPool", "ClassOrNeutralWeaponPool",
        "ComboCardPool",
        "Cost1MinionPool", "Cost2MinionPool", "Cost3BeastMinionPool", "Cost3MinionPool", "Cost4MinionPool",
        "Cost5MinionPool", "Cost6MinionPool", "Cost7MinionPool", "Cost8MinionPool", "CostAtLeast5SpellPool",
        "DeathrattleMinionPool", "DemonHunterSpellPool", "DemonMinionPool", "DragonMinionPool",
        "DruidCardPool", "DruidSpellPool",
        "ElementalMinionPool",
        "FelSpellPool", "FireSpellPool", "FrostRuneCardPool", "FrostSpellPool",
        "HolySpellPool",
        "LegendaryMinionPool",
        "MageMinionPool", "MageSecretPool", "MageSpellPool", "MechMinionPool", "MinionPool", "MurlocMinionPool",
        "NatureSpellPool",
        "OffClassCardPool", "OffClassLegendaryMinionPool", "OffClassSecretPool", "OffClassSpellPool",
        "OutcastCardPool",
        "PaladinCardPool", "PlayerClassCost1SpellPool", "PlayerClassSpellPool", "PriestSpellPool",
        "RewindCardPool",
        "ShadowSpellPool", "ShamanSpellPool", "SpellPool",
        "TauntMinionPool",
        "UndeadMinionPool",
        "WeaponPool"
    ]

    private static var cacheMonoClassList = [MonoClassInitializer.Type]()
    private static var cacheActiveEffectClassList = [EntityBasedEffect.Type]()
    private static var cacheCounterClassList = [BaseCounter.Type]()
    private static var cacheRelatedClassList = [ICardWithRelatedCards.Type]()
    private static var cacheHighlightClassList = [ICardWithHighlight.Type]()
    private static var cacheSpellSchoolTutorClassList = [ISpellSchoolTutor.Type]()
    private static var cacheCardGeneratorClassList = [ICardGenerator.Type]()

    static func initialize() {
        var count: UInt32 = 0
        let classListPtr = objc_copyClassList(&count)
        defer {
          free(UnsafeMutableRawPointer(classListPtr))
        }
        let classListBuffer = UnsafeBufferPointer(
          start: classListPtr, count: Int(count)
        )
        
        classListBuffer.forEach { cl in
            // checking the name of the class for HSTracker prefix speeds it up from 12s to 100ms
            // it also avoids some weird crashes that happen when trying to cast it to a type instead of
            // protocol
            let name = class_getName(cl)
            if memcmp(name, "HSTracker.", 10) != 0 {
                return
            }
            let isAbstractPoolBase = abstractPoolBaseClassNames.contains(String(cString: name).replacingOccurrences(of: "HSTracker.", with: ""))
            if let mcl = cl as? MonoClassInitializer.Type {
                cacheMonoClassList.append(mcl)
            } else if let aecl = cl as? EntityBasedEffect.Type {
                cacheActiveEffectClassList.append(aecl)
            } else if let dccl = cl as? BaseCounter.Type, cl != BaseCounter.self && cl != StatsCounter.self && cl != NumericCounter.self {
                cacheCounterClassList.append(dccl)
            } else if let rccl = cl as? ICardWithRelatedCards.Type, rccl != ResurrectionCard.self, !isAbstractPoolBase {
                cacheRelatedClassList.append(rccl)
            } else if let hccl = cl as? ICardWithHighlight.Type {
                cacheHighlightClassList.append(hccl)
            }
            if let sstcl = cl as? ISpellSchoolTutor.Type {
                cacheSpellSchoolTutorClassList.append(sstcl)
            }
            if let cgcl = cl as? ICardGenerator.Type, !isAbstractPoolBase {
                cacheCardGeneratorClassList.append(cgcl)
            }
        }
    }
    
    static func getMonoClasses() -> [MonoClassInitializer.Type] {
        return cacheMonoClassList
    }
    
    static func getActiveEffectClasses() -> [EntityBasedEffect.Type] {
        return cacheActiveEffectClassList
    }
    
    static func getCounterClasses() -> [BaseCounter.Type] {
        return cacheCounterClassList
    }
    
    static func getRelatedClases() -> [ICardWithRelatedCards.Type] {
        return cacheRelatedClassList
    }
    
    static func getHighlightClasses() -> [ICardWithHighlight.Type] {
        return cacheHighlightClassList
    }
    
    static func getSpellSchoolTutorClasses() -> [ISpellSchoolTutor.Type] {
        return cacheSpellSchoolTutorClassList
    }
    
    static func getCardGeneratorClasses() -> [ICardGenerator.Type] {
        return cacheCardGeneratorClassList
    }
}
