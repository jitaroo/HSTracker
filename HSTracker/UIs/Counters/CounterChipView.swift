//
//  CounterChipView.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/26/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import SwiftUI

// SwiftUI replacement for the old CounterView.xib (an AppKit NSView pill: a
// circular card-art crop + a ChunkFive counter value, hosted in
// CountersOverlay's NSCollectionView-free custom-layout NSView). Geometry
// below (margins, circle crop offsets, corner radius) is ported verbatim from
// that xib rather than redesigned, so the pill looks identical.

@available(macOS 10.15, *)
final class CounterChipViewModel: ObservableObject, Identifiable {
    let counter: BaseCounter
    var id: ObjectIdentifier { ObjectIdentifier(counter) }

    @Published private(set) var counterValue: String
    @Published private(set) var isDisplayValueLong: Bool
    @Published private(set) var cardImage: NSImage?

    init(counter: BaseCounter) {
        self.counter = counter
        self.counterValue = counter.counterValue
        self.isDisplayValueLong = counter.isDisplayValueLong
        counter.propertyChanged = { [weak self] _ in
            guard let self else { return }
            DispatchQueue.main.async {
                self.counterValue = self.counter.counterValue
                self.isDisplayValueLong = self.counter.isDisplayValueLong
            }
        }
        loadImage()
    }

    private func loadImage() {
        guard let cardId = counter.cardIdToShowInUI else { return }
        ImageUtils.art(for: cardId) { [weak self] image in
            DispatchQueue.main.async { self?.cardImage = image }
        }
    }

    // Ported from CounterView.setFontSize(): the font shrinks (floor 5pt)
    // until the word-wrapped value fits the 37pt-tall circle-height budget -
    // the chip's own height never grows past 51pt, only the font shrinks.
    var fontSize: CGFloat {
        guard isDisplayValueLong else { return 15 }
        var size: CGFloat = 16
        while size > 5 {
            if measuredHeight(fontSize: size) <= 37 { break }
            size -= 1
        }
        return size
    }

    private var textWidth: CGFloat {
        isDisplayValueLong ? min(measuredWidth(fontSize: fontSize), 100) : measuredWidth(fontSize: fontSize)
    }

    // CounterView.intrinsicContentSize's formula (2*5 outer margin + 2 border
    // + 37 circle + 10 left text margin + text + 10 right text margin) doesn't
    // carry over unchanged: unlike NSBox's borderWidth, a SwiftUI .overlay()
    // stroke doesn't consume any of the view's own reported layout size, so
    // this constant is measured directly against this view's actual body
    // (via NSHostingView.fittingSize) rather than re-derived by analogy -
    // getting it too small silently clips the digits against the next chip,
    // since the chip is wrapped in .clipped() to stop overflow the other way.
    var chipWidth: CGFloat {
        67 + textWidth
    }

    private func measuredWidth(fontSize: CGFloat) -> CGFloat {
        guard let font = NSFont(name: "ChunkFive", size: fontSize) else { return 20 }
        return ceil((counterValue as NSString).size(withAttributes: [.font: font]).width)
    }

    private func measuredHeight(fontSize: CGFloat) -> CGFloat {
        guard let font = NSFont(name: "ChunkFive", size: fontSize) else { return 0 }
        let bounding = (counterValue as NSString).boundingRect(
            with: NSSize(width: 100, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin],
            attributes: [.font: font])
        return ceil(bounding.height)
    }
}

// Reports mouseEntered/mouseExited plus the NSView itself (needed to convert
// to a screen-space frame for RelatedCardsTooltipPanel, same as the old
// CounterView.tooltipDisplay did with `self.convert(self.bounds, to: nil)`).
@available(macOS 10.15, *)
private final class CounterChipHoverNSView: NSView {
    var onHoverChanged: ((Bool, NSView) -> Void)?
    private var trackingArea: NSTrackingArea?

    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        if let trackingArea { removeTrackingArea(trackingArea) }
        let area = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeAlways, .inVisibleRect], owner: self, userInfo: nil)
        addTrackingArea(area)
        trackingArea = area
    }

    override func mouseEntered(with event: NSEvent) { onHoverChanged?(true, self) }
    override func mouseExited(with event: NSEvent) { onHoverChanged?(false, self) }
}

@available(macOS 10.15, *)
private struct CounterChipHoverRepresentable: NSViewRepresentable {
    let onHoverChanged: (Bool, NSView) -> Void

    func makeNSView(context: Context) -> CounterChipHoverNSView { CounterChipHoverNSView() }
    func updateNSView(_ nsView: CounterChipHoverNSView, context: Context) {
        nsView.onHoverChanged = onHoverChanged
    }
}

@available(macOS 10.15, *)
struct CounterChipView: View {
    @ObservedObject var viewModel: CounterChipViewModel
    @SwiftUI.State private var pendingShowWork: DispatchWorkItem?

    private static let showDelay: TimeInterval = 0.6

    var body: some View {
        HStack(spacing: 0) {
            circleImage
                .frame(width: 37, height: 37)
            Text(viewModel.counterValue)
                .chunkFive(size: viewModel.fontSize)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(viewModel.isDisplayValueLong ? nil : 1)
                // maxWidth (not width): a plain `.frame(width: 100)` is a fixed
                // assignment, so it always reports/occupies exactly 100pt even
                // when the current value is short (e.g. PlayedSpellSchoolsCounter's
                // "None" before any spell school has been cast) - badly
                // undersizing chipWidth below, which only budgets for the
                // *measured* (potentially much narrower) text. maxWidth caps
                // wrapping at 100 while still shrinking for shorter text, matching
                // chipWidth's min(measuredWidth, 100) below.
                .frame(maxWidth: viewModel.isDisplayValueLong ? 100 : nil)
                // Without this, a `.frame(width:)` constraint doesn't actually
                // force wrapping - Text still reports (and paints) its full
                // unwrapped width, overflowing into the next chip in the row.
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 10)
        }
        .frame(height: 41, alignment: .leading)
        .background(Color(hex: "#2E3437").opacity(0.75))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(hex: "#141617"), lineWidth: 2))
        .cornerRadius(20)
        .padding(5)
        .frame(width: viewModel.chipWidth, height: 51, alignment: .leading)
        .clipped()
        .background(CounterChipHoverRepresentable(onHoverChanged: handleHover))
    }

    private var circleImage: some View {
        // Ported from CounterView.xib's image constraints: leading = -10,
        // top = -7 relative to the 37x37 circle - i.e. the oversized image's
        // top-left corner sits 10pt left of and 7pt above the circle's own
        // top-left corner. That only reproduces correctly if the image is
        // anchored .topLeading before the offset is applied: a ZStack (which
        // defaults to .center) centers the 55.5x55.5 image first, and the
        // same offset then lands ~9pt further out in both directions than
        // intended, cropping a noticeably different region of the art.
        Group {
            if let cardImage = viewModel.cardImage {
                Image(nsImage: cardImage).resizable().aspectRatio(contentMode: .fill)
            } else {
                Color.clear
            }
        }
        .frame(width: 55.5, height: 55.5)
        .offset(x: -10, y: -7)
        .frame(width: 37, height: 37, alignment: .topLeading)
        .clipShape(Circle())
    }

    private func handleHover(_ hovering: Bool, _ nsView: NSView) {
        pendingShowWork?.cancel()
        pendingShowWork = nil
        if hovering {
            let work = DispatchWorkItem { showTooltip(from: nsView) }
            pendingShowWork = work
            DispatchQueue.main.asyncAfter(deadline: .now() + Self.showDelay, execute: work)
        } else {
            RelatedCardsTooltipPanel.shared.hide()
        }
    }

    // Ported from the old CounterView.tooltipDisplay: butt the tooltip
    // against whichever side of the chip's window has room, clamped so it
    // never runs past the top of the Hearthstone window.
    private func showTooltip(from nsView: NSView) {
        guard let window = nsView.window else { return }
        let cardsToDisplay = viewModel.counter.cardsToDisplay
        if cardsToDisplay.isEmpty { return }

        let windowRect = window.frame
        let hsFrame = SizeHelper.hearthstoneWindow.frame

        let cardImages = RelatedCardsTooltipPanel.shared
        cardImages.setTitle(viewModel.counter.localizedName)
        cardImages.setCardIdsFromCards(cardsToDisplay)

        let hoverFrame = NSRect(x: 0, y: 0, width: cardImages.gridWidth, height: cardImages.gridHeight)

        let x: CGFloat
        if windowRect.origin.x < hoverFrame.size.width {
            x = windowRect.origin.x + windowRect.size.width
        } else {
            x = windowRect.origin.x - hoverFrame.size.width
        }

        let cellFrameRelativeToWindow = nsView.convert(nsView.bounds, to: nil)
        let cellFrameRelativeToScreen = window.convertToScreen(cellFrameRelativeToWindow)

        var y: CGFloat = cellFrameRelativeToScreen.origin.y
        if y + hoverFrame.height > hsFrame.maxY {
            y = hsFrame.maxY - hoverFrame.height
        }

        cardImages.show(frame: NSRect(x: x, y: y, width: hoverFrame.width, height: hoverFrame.height))
    }
}
