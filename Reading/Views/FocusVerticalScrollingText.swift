//
//  FocusVerticalScrollingText.swift
//  Reading
//
//  Created by Shawn Roller on 2/27/24.
//

import SwiftUI
import SwiftUIIntrospect

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

struct FocusVerticalScrollingText: View {
    var text: String
    @State private var splitText = [String]()
    
    var body: some View {
        ScrollViewReader { proxy in
            Button("Scroll") {
                withAnimation(.easeInOut(duration: 10)) {
                    proxy.scrollTo(splitText.last)
                }
            }
            .onHover { hover in
                print("hovering on button \(hover)")
            }
            ScrollView {
                ForEach(splitText) { t in
                    Text("\(t)\n\n")
                        .id(t)
                        .hoverEffectDisabled(false)
                        .onHover { isHovering in
                            print("hovering over \(String(t.prefix(5)))")
                            if (isHovering) {
                                withAnimation {
                                    proxy.scrollTo(t, anchor: .center)
                                }
                            }
                        }
                }
            }
            .introspect(.scrollView, on: .visionOS(.v1)) { scrollView in
                scrollView.setValue(8.0, forKeyPath: "contentOffsetAnimationDuration")
            }
        }
        .onAppear {
            splitText = text.split(separator: "\n\n").map { String($0) }
        }
        .frame(depth: 15)
        .padding()
    }
}

#Preview {
    FocusVerticalScrollingText(text: TEST_STRING)
}
