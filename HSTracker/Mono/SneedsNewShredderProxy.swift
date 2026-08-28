//
//  SneedsNewShredderProxy.swift
//  HSTracker
//

import Foundation

class SneedsNewShredderProxy: MonoClassInitializer {
    static var _class: OpaquePointer?
    static var _members = [String: OpaquePointer]()

    static func initialize() {
        if SneedsNewShredderProxy._class == nil {
            SneedsNewShredderProxy._class = MonoHelper.loadClass(ns: "BobsBuddy.Minions.Buddy", name: "SneedsNewShredder")
        }
    }
}
