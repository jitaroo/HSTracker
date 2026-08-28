//
//  IDeathrattleProxy.swift
//  HSTracker
//
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import Foundation

class IDeathrattleProxy: MonoClassInitializer {
    static var _class: OpaquePointer?
    static var _members = [String: OpaquePointer]()

    static func initialize() {
        if IDeathrattleProxy._class == nil {
            IDeathrattleProxy._class = MonoHelper.loadClass(ns: "BobsBuddy.Simulation", name: "IDeathrattle")
        }
    }
}
