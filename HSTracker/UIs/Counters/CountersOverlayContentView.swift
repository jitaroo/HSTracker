//
//  CountersOverlayContentView.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import SwiftUI

// Replaces the old CountersView.layout(): greedily wraps chips into rows no
// wider than the overlay's fixed 336pt width (SizeHelper.playerCountersFrame/
// opponentCountersFrame), stacking overflow rows below the first - the first
// row filled is the one closest to the anchored edge, matching the old
// bottom-up AppKit layout (row 0 at the higher y, each subsequent row 49pt
// lower), which a plain top-to-bottom VStack reproduces directly.
@available(macOS 10.15, *)
struct CountersOverlayContentView: View {
    let visibility: Bool
    let chips: [CounterChipViewModel]

    private static let maxWidth: CGFloat = 336

    private var rows: [[CounterChipViewModel]] {
        var rows: [[CounterChipViewModel]] = []
        var current: [CounterChipViewModel] = []
        var width: CGFloat = 0
        for chip in chips {
            let chipWidth = chip.chipWidth
            if width + chipWidth > Self.maxWidth && !current.isEmpty {
                rows.append(current)
                current = []
                width = 0
            }
            current.append(chip)
            width += chipWidth
        }
        if !current.isEmpty { rows.append(current) }
        return rows
    }

    var body: some View {
        if visibility {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                    HStack(spacing: 0) {
                        ForEach(row) { chip in
                            CounterChipView(viewModel: chip)
                        }
                    }
                }
            }
            .frame(width: Self.maxWidth, alignment: .topLeading)
        }
    }
}
