//
//  BattlegroundsTribeIconView.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/24/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import SwiftUI

// Mirrors HDT's BattlegroundsTribe.xaml (Controls/Overlay/Battlegrounds/Session):
// a circular, green-ringed tribe portrait with the tribe's localized name below
// it. Guide views (HeroGuide.xaml, TrinketGuideTooltip.xaml, etc.) all render
// their "Favorable Minions" lists with this control at LayoutTransform
// ScaleX/Y="0.9", rather than the flat square icon HSTracker used to show -
// hence the `scale` parameter instead of a fixed size.
@available(macOS 10.15, *)
struct BattlegroundsTribeIconView: View {
    let race: Race
    var scale: CGFloat = 1.0

    // BattlegroundsTribe.xaml's outer Canvas is 38x38 with a 2pt border ring
    // and a 34pt image ellipse inside it; the name label below is a 16pt-tall
    // stack, FontSize 10, MaxWidth 38.
    private var canvasSize: CGFloat { 38 * scale }
    private var circleSize: CGFloat { 34 * scale }
    private var borderWidth: CGFloat { 2 * scale }

    var body: some View {
        VStack(spacing: 2 * scale) {
            ZStack {
                Image(BattlegroundsMinionType.race(race).iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: circleSize, height: circleSize)
                    .clipShape(Circle())
                // BorderColor defaults to "#16d220" (Availability.Available) -
                // none of the guide call sites bind Availability, so it's
                // always the green ring, never the banned/red one.
                Circle()
                    .stroke(Color(hex: "#16d220"), lineWidth: borderWidth)
                    .frame(width: circleSize, height: circleSize)
            }
            .frame(width: canvasSize, height: canvasSize)
            Text(BattlegroundsMinionType.raceName(race))
                .font(.system(size: 10 * scale))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .frame(width: canvasSize, height: 16 * scale)
        }
        .fixedSize()
    }
}
