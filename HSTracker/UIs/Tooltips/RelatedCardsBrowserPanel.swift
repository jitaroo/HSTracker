//
//  RelatedCardsBrowserPanel.swift
//  HSTracker
//
//  Created by Francisco Moraes on 8/27/26.
//  Copyright © 2026 Benjamin Michotte. All rights reserved.
//

import SwiftUI

// Ports HDT's Controls/Overlay/Constructed/RelatedCardsPanel/RelatedCardsPanel.xaml{,.cs} (plus
// its RelatedCardsPanelViewModel.cs, CostFilterButton.cs and KeywordFilterButton.cs): the
// "right-click to see all options" full-pool browser for a card whose related-cards pool is too
// large for RelatedCardsTooltipPanel's compact grid (see RelatedCardsManager.largePoolThreshold).
//
// Unlike RelatedCardsTooltipPanel (a click-through hover tooltip), this panel is meant to be
// interacted with - scrolled, filtered, dismissed - so its NSPanel does not set
// ignoresMouseEvents. It follows ToastWindowController's pattern for an interactive
// non-activating overlay panel instead (borderless + nonactivatingPanel + isFloatingPanel, mouse
// events NOT ignored).
//
// HDT gates its cost/keyword filter bar behind OutfinderTrial.HasAccess (a premium/trial-only
// feature) and shows a "Free Version" HSReplay-branding row when it isn't available. Neither the
// trial system nor that branding exists in HSTracker yet (see RelatedCardsTooltipPanel's own
// PoolSummaryPanelView comment), so filters are simply always available here: the cost filter
// works unconditionally, and the keyword filter naturally stays hidden until
// RelatedCardsManager.relatedCardsSummaryKeywords is ever populated.
@available(macOS 10.15, *)
final class RelatedCardsBrowserViewModel: ObservableObject {
    @Published var cardName: String = ""
    @Published var cards: [Card] = []
    @Published var isFilterOpen: Bool = false
    @Published private(set) var activeCostFilters: Set<Int> = []
    @Published private(set) var activeKeyword: String?

    var onClose: (() -> Void)?

    var headerText: String {
        String(format: String.localizedString("TheOutfinder_Label_PoolHeader", comment: ""), cardName, cards.count)
    }

    // Only offered once the pool has more than 2 distinct costs - matches
    // RelatedCardsPanelViewModel.ShowCostFilters, avoiding a filter row for a pool where every
    // card is (say) cost 1 or 2.
    var costFilters: [Int] {
        let distinct = Set(cards.map { $0.cost }).sorted()
        return distinct.count > 2 ? distinct : []
    }

    // Mirrors RelatedCardsPanelViewModel.RebuildKeywordFilters: only keywords that actually match
    // at least one card in this specific pool are offered, sorted by match count (desc) then name.
    var keywordFilters: [(keyword: String, label: String, count: Int)] {
        guard let keywords = RelatedCardsManager.relatedCardsSummaryKeywords else { return [] }
        let cardIds = Set(cards.map { $0.id })
        return keywords.compactMap { keyword, ids -> (String, String, Int)? in
            let count = ids.intersection(cardIds).count
            guard count > 0 else { return nil }
            return (keyword, RelatedCardsManager.localizeKeywordName(keyword), count)
        }
        .sorted { $0.2 != $1.2 ? $0.2 > $1.2 : $0.0 < $1.0 }
        .map { (keyword: $0.0, label: $0.1, count: $0.2) }
    }

    var hasAnyFilter: Bool {
        !costFilters.isEmpty || !keywordFilters.isEmpty
    }

    var hasActiveFilter: Bool {
        activeKeyword != nil || !activeCostFilters.isEmpty
    }

    var filteredCards: [Card] {
        guard hasActiveFilter else { return cards }
        var matchIds: Set<String>?
        if let activeKeyword, let keywords = RelatedCardsManager.relatedCardsSummaryKeywords {
            matchIds = keywords[activeKeyword]
        }
        return cards.filter { card in
            (matchIds == nil || matchIds!.contains(card.id)) &&
                (activeCostFilters.isEmpty || activeCostFilters.contains(card.cost))
        }
    }

    var filterMatchText: String {
        "\(filteredCards.count)/\(cards.count)"
    }

    func toggleFilterDrawer() {
        isFilterOpen.toggle()
    }

    func toggleKeyword(_ keyword: String) {
        activeKeyword = activeKeyword == keyword ? nil : keyword
    }

    func toggleCost(_ cost: Int) {
        if activeCostFilters.contains(cost) {
            activeCostFilters.remove(cost)
        } else {
            activeCostFilters.insert(cost)
        }
    }

    func reset(cardName: String, cards: [Card]) {
        self.cardName = cardName
        self.cards = cards
        isFilterOpen = false
        activeCostFilters = []
        activeKeyword = nil
    }

    func close() {
        onClose?()
    }
}

@available(macOS 10.15, *)
private struct FilterChipView: View {
    let label: String
    let isActive: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 11))
                .foregroundColor(isActive ? Color(hex: "#FFB00D") : .white)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(isActive ? Color(hex: "#201A00") : Color(hex: "#1E2426"))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(isActive ? Color(hex: "#FFB00D") : Color(hex: "#3A4A52"), lineWidth: 1))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Small square art crop for a row tile - a simpler variant of RelatedCardsTooltipPanel's
// RelatedCardImageView (that one insets for the grid's 194pt-tall cells; this one is a fixed,
// much smaller thumbnail so the crop math isn't worth sharing).
@available(macOS 10.15, *)
private struct RelatedCardsBrowserArtView: View {
    let card: Card
    @SwiftUI.State private var image: NSImage?

    var body: some View {
        Group {
            if let image {
                Image(nsImage: image).resizable().aspectRatio(contentMode: .fill)
            } else {
                Color(hex: "#1A2228")
            }
        }
        .frame(width: 42, height: 32)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .onAppear(perform: loadImage)
    }

    private func loadImage() {
        let cardId = card.id
        if card.baconCard {
            ImageUtils.cardArtBG(for: cardId, baconTriple: false) { img in
                DispatchQueue.main.async { self.image = img }
            }
        } else {
            ImageUtils.cardArt(for: cardId) { img in
                DispatchQueue.main.async { self.image = img }
            }
        }
    }
}

// A single row in the pool list - ports CardTile.xaml's row shape (cost gem, art, name) without
// the count/mulligan/highlight extras that only make sense in an actual deck list.
@available(macOS 10.15, *)
private struct RelatedCardsBrowserTileView: View {
    let card: Card

    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                Circle().fill(Color(hex: "#1560A8"))
                Text(verbatim: "\(card.cost)")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width: 22, height: 22)

            RelatedCardsBrowserArtView(card: card)

            Text(card.name)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .lineLimit(1)
                .truncationMode(.tail)

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(hex: "#20282C"))
        .cornerRadius(6)
    }
}

@available(macOS 10.15, *)
private struct RelatedCardsBrowserContentView: View {
    @ObservedObject var viewModel: RelatedCardsBrowserViewModel
    static let width: CGFloat = 320

    var body: some View {
        VStack(spacing: 0) {
            header
            if viewModel.hasAnyFilter {
                filterBar
                if viewModel.isFilterOpen {
                    filterDrawer
                }
            }
            cardList
        }
        .frame(width: Self.width)
        .background(Color(hex: "#DD1E2428"))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "#2C3A42"), lineWidth: 1))
    }

    private var header: some View {
        HStack {
            Text(viewModel.headerText)
                .chunkFive(size: 14)
                .foregroundColor(.white)
                .lineLimit(1)
            Spacer(minLength: 8)
            Button(action: { viewModel.close() }) {
                // "xmark" (SF Symbols) needs macOS 11 - this file's baseline is 10.15, matching
                // the rest of this port - so a plain glyph stands in for the icon.
                Text(verbatim: "\u{2715}")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color(hex: "#1C2022"))
        .cornerRadius(12, corners: [.topLeft, .topRight])
    }

    private var filterBar: some View {
        Button(action: { viewModel.toggleFilterDrawer() }) {
            HStack {
                HStack(spacing: 6) {
                    Text(String.localizedString("TheOutfinder_Label_Filters", comment: "").uppercased())
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(Color(hex: "#FFB00D"))
                    if viewModel.hasActiveFilter {
                        Circle().fill(Color(hex: "#FFB00D")).frame(width: 5, height: 5)
                    }
                }
                Spacer()
                Text(viewModel.filterMatchText)
                    .font(.system(size: 10))
                    .foregroundColor(viewModel.hasActiveFilter ? Color(hex: "#FFB00D") : Color(hex: "#8A9BA8"))
                Text(verbatim: viewModel.isFilterOpen ? "\u{25B4}" : "\u{25BE}")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 12)
            .frame(height: 32)
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color(hex: "#1A1C1E"))
        .overlay(Rectangle().frame(height: 1).foregroundColor(Color(hex: "#2C3540")), alignment: .bottom)
    }

    private var filterDrawer: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !viewModel.keywordFilters.isEmpty {
                ChunkedChipRows(items: viewModel.keywordFilters, itemsPerRow: 3) { entry in
                    FilterChipView(label: entry.label, isActive: viewModel.activeKeyword == entry.keyword) {
                        viewModel.toggleKeyword(entry.keyword)
                    }
                }
            }
            if !viewModel.costFilters.isEmpty {
                VStack(alignment: .leading, spacing: 5) {
                    Text(String.localizedString("TheOutfinder_Label_Cost", comment: "").uppercased())
                        .font(.system(size: 9, weight: .semibold))
                        .foregroundColor(.white)
                    ChunkedChipRows(items: viewModel.costFilters, itemsPerRow: 6) { cost in
                        FilterChipView(label: "\(cost)", isActive: viewModel.activeCostFilters.contains(cost)) {
                            viewModel.toggleCost(cost)
                        }
                    }
                }
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "#17191B"))
        .overlay(Rectangle().frame(height: 1).foregroundColor(Color(hex: "#2C3540")), alignment: .bottom)
    }

    private var cardList: some View {
        ScrollView {
            VStack(spacing: 4) {
                ForEach(Array(viewModel.filteredCards.enumerated()), id: \.offset) { _, card in
                    RelatedCardsBrowserTileView(card: card)
                }
            }
            .padding(8)
        }
        .frame(maxHeight: 480)
    }
}

// SwiftUI has no WrapPanel equivalent pre-macOS 13's Layout protocol (this file's baseline is
// 10.15, matching the rest of this port), so filter chips wrap the same way
// RelatedCardsTooltipPanel's keyword-chip summary already does: chunked into fixed-size rows by
// index math rather than a true flow layout. A fixed row size is a fair approximation for a
// handful of filter chips in a 320pt-wide panel.
@available(macOS 10.15, *)
private struct ChunkedChipRows<Data: RandomAccessCollection, RowContent: View>: View where Data.Index == Int {
    let items: Data
    let itemsPerRow: Int
    let rowContent: (Data.Element) -> RowContent

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(0..<Int(ceil(Double(items.count) / Double(itemsPerRow))), id: \.self) { row in
                HStack(spacing: 4) {
                    ForEach(0..<itemsPerRow, id: \.self) { column in
                        let index = row * itemsPerRow + column
                        if index < items.count {
                            rowContent(items[items.index(items.startIndex, offsetBy: index)])
                        }
                    }
                }
            }
        }
    }
}

// Public surface mirrors RelatedCardsTooltipPanel's shape: an NSPanel-backed singleton with
// simple show/hide entry points, following the same NSPanel + NSHostingView precedent.
@available(macOS 10.15, *)
final class RelatedCardsBrowserPanel: NSPanel {
    static let shared = RelatedCardsBrowserPanel()

    private let viewModel = RelatedCardsBrowserViewModel()

    private init() {
        super.init(
            contentRect: NSRect(x: 0, y: 0, width: Int(RelatedCardsBrowserContentView.width), height: 600),
            styleMask: [.borderless, .nonactivatingPanel],
            backing: .buffered,
            defer: true
        )
        isOpaque = false
        backgroundColor = .clear
        // Unlike RelatedCardsTooltipPanel, this panel is meant to be clicked and scrolled -
        // ignoresMouseEvents stays false (the default), matching ToastWindowController's pattern
        // for an interactive non-activating overlay panel.
        hasShadow = true
        isFloatingPanel = true
        hidesOnDeactivate = false
        animationBehavior = .none
        level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(CGWindowLevelKey.normalWindow)) + 1)

        viewModel.onClose = { [weak self] in self?.hide() }

        contentView = NSHostingView(rootView: RelatedCardsBrowserContentView(viewModel: viewModel))

        // Dismiss when the user leaves the game, like every other overlay.
        //
        // CardImageTooltip does this by hiding on Hearthstone's *deactivation*, but that rule
        // can't be reused here: this panel is interactive, and bringing HSTracker forward to
        // click a filter deactivates Hearthstone - which would dismiss the panel the moment it
        // was used. Keying off which app just became active instead keeps it open for both
        // Hearthstone and HSTracker, and closes it for anything else (alt-tabbing to a browser,
        // Hearthstone being minimized, etc).
        NSWorkspace.shared.notificationCenter.addObserver(
            self,
            selector: #selector(otherAppActivated(_:)),
            name: NSWorkspace.didActivateApplicationNotification,
            object: nil
        )
    }

    @objc private func otherAppActivated(_ notification: Notification) {
        guard isVisible else { return }
        guard let app = notification.userInfo?[NSWorkspace.applicationUserInfoKey] as? NSRunningApplication else { return }
        if app.localizedName == CoreManager.applicationName { return }
        if app.bundleIdentifier == Bundle.main.bundleIdentifier { return }
        hide()
    }

    var isShown: Bool {
        isVisible
    }

    // sourceCard/pool mirror HDT's ShowRelatedCardsPanel(Card sourceCard, List<Card> relatedCards)
    // call - the card whose pool this is (for the header text) and the full pool to browse.
    func show(sourceCard: Card, relatedCards: [Card], near frame: NSRect) {
        collectionBehavior = Settings.canJoinFullscreen ? [.canJoinAllSpaces, .fullScreenAuxiliary] : []
        viewModel.reset(cardName: sourceCard.name, cards: relatedCards)

        var origin = NSPoint(x: frame.maxX + 12, y: frame.maxY - 600)
        if let screen = NSScreen.screens.first(where: { $0.frame.contains(frame.origin) }) ?? NSScreen.main {
            if origin.x + RelatedCardsBrowserContentView.width > screen.frame.maxX {
                origin.x = frame.minX - RelatedCardsBrowserContentView.width - 12
            }
            if origin.y < screen.frame.minY {
                origin.y = screen.frame.minY
            }
            if origin.y + 600 > screen.frame.maxY {
                origin.y = screen.frame.maxY - 600
            }
        }
        if origin.x.isFinite && origin.y.isFinite {
            setFrameOrigin(origin)
        }
        makeKeyAndOrderFront(nil)
    }

    func hide() {
        orderOut(nil)
    }
}
