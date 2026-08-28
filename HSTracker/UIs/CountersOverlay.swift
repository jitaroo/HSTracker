//
//  CountersOverlay.swift
//  HSTracker
//
//  Created by Francisco Moraes on 10/26/24.
//  Copyright © 2024 Benjamin Michotte. All rights reserved.
//

import Foundation
import SwiftUI

// Not itself gated to macOS 10.15 (WindowManager/Game.swift/AppDelegate hold
// and call this unconditionally, same as before this was ported to SwiftUI) -
// only the private content-rebuilding path touches SwiftUI/NSHostingView,
// gated internally with `if #available`. See CountersOverlayContentView.swift
// and CounterChipView.swift for the actual SwiftUI content, which replaces
// the old CountersView/CounterView.xib AppKit views.
class CountersOverlay: OverWindowController {
    private(set) var _counters: CounterManager!
    var isPlayer = false

    @objc dynamic var visibility = false {
        didSet {
            if #available(macOS 10.15, *) {
                refreshContent()
            }
        }
    }

    var countersListChanged: (() -> Void)?

    func setCounters(_ counters: CounterManager) {
        _counters = counters
        _counters.addCountersChangedListener(countersChanged)
    }

    private func countersChanged() {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                self.countersChanged()
            }
            return
        }
        updateVisibleCounters()
    }

    var visibleCounters = SynchronizedArray<BaseCounter>()

    // Tracks how many chips the SwiftUI content last rendered, so needsUpdate()
    // stays cheap and available on every OS version - the actual view model
    // objects (CounterChipViewModel) are 10.15-only and rebuilt fresh inside
    // refreshContent() rather than kept as a stored property here.
    private var renderedCounterCount = 0

    override func windowDidLoad() {
        super.windowDidLoad()
        if #available(macOS 10.15, *) {
            window?.contentView = NSHostingView(rootView: CountersOverlayContentView(visibility: visibility, chips: []))
        }
    }

    @available(macOS 10.15, *)
    private func refreshContent() {
        guard let hostingView = window?.contentView as? NSHostingView<CountersOverlayContentView> else { return }
        let chips = visibleCounters.array().map { CounterChipViewModel(counter: $0) }
        renderedCounterCount = chips.count
        hostingView.rootView = CountersOverlayContentView(visibility: visibility, chips: chips)
    }

    @MainActor
    func updateVisibleCounters() {
        let visibleCounters = _counters.getVisibleCounters(controlledByPlayer: isPlayer)

        var changed = false
        for counter in self.visibleCounters.array() where !visibleCounters.contains(counter) {
            self.visibleCounters.remove(counter)
            changed = true
        }

        for counter in visibleCounters where !self.visibleCounters.contains(counter) {
            self.visibleCounters.append(counter)
            changed = true
        }

        if changed || renderedCounterCount != visibleCounters.count {
            if #available(macOS 10.15, *) {
                refreshContent()
            }
        }

        sortVisibleCounters()
    }

    private func sortVisibleCounters() {
        if !AppDelegate.instance().coreManager.game.isBattlegroundsMatch() {
            return
        }

        visibleCounters.sort(by: { $0.sortValue < $1.sortValue })
    }

    func forceShowExampleCounters() {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                self.forceShowExampleCounters()
            }
            return
        }
        visibleCounters.removeAll()

        let exampleCounters = _counters.getExampleCounters(controlledByPlayer: isPlayer)

        for counter in exampleCounters {
            visibleCounters.append(counter)
        }
        if #available(macOS 10.15, *) {
            refreshContent()
        }
    }

    func forceHideExampleCounters() {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                self.forceHideExampleCounters()
            }
            return
        }
        visibleCounters.removeAll()
        updateVisibleCounters()
    }

    func needsUpdate() -> Bool {
        return renderedCounterCount != visibleCounters.count
    }

    func update() {
        if #available(macOS 10.15, *) {
            refreshContent()
        }
    }
}
