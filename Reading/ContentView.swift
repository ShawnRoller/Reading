//
//  ContentView.swift
//  Reading
//
//  Created by Shawn Roller on 2/27/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

enum TextType {
    case Straight
    case VerticalScrolling
    case FocusVerticalScrolling
    case Paging
}

struct ContentView: View {
    @State private var textType = TextType.FocusVerticalScrolling
    @State private var text = TEST_STRING
    
    var body: some View {
        VStack {
            Group {
                switch (textType) {
                    case .Straight:
                        StraightText(text: text)
                    case .VerticalScrolling:
                        VerticalScrollingText(text: text)
                    case .FocusVerticalScrolling:
                        FocusVerticalScrollingText(text: text)
                    case .Paging:
                        PagerText(text: text)
                }
            }
        }
        .padding()
        .ornament(visibility: .visible, attachmentAnchor: .scene(.leading)) {
            Button {
                textType = .Straight
            } label: {
                Label("Straight", systemImage: "text.alignleft")
                    .labelStyle(.iconOnly)
            }
            Button {
                textType = .VerticalScrolling
            } label: {
                Label("Straight", systemImage: "arrow.up.and.down.text.horizontal")
                    .labelStyle(.iconOnly)
            }
            Button {
                textType = .FocusVerticalScrolling
            } label: {
                Label("Straight", systemImage: "rectangle.and.text.magnifyingglass")
                    .labelStyle(.iconOnly)
            }
            Button {
                textType = .Paging
            } label: {
                Label("Paging", systemImage: "book.pages")
                    .labelStyle(.iconOnly)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
