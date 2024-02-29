//
//  PagerText.swift
//  Reading
//
//  Created by Shawn Roller on 2/28/24.
//

import SwiftUI

struct PagerText: View {
    var text: String
    @State private var splitText = [String]()
    @State private var selection = ""
    @State private var currentIndex = 0 {
        didSet {
            withAnimation(.snappy) {
                selection = splitText[currentIndex]
            }
        }
    }
    
    var body: some View {
        VStack {
            Text(selection)
        }
        .onAppear {
            splitText = text.split(separator: "\n\n").map { String($0) }
            guard splitText.count > 0 else { fatalError("no text") }
            selection = splitText.first!
        }
        .onTapGesture {
            if currentIndex + 1 < splitText.count {
                currentIndex += 1
            } else {
                currentIndex = 0
            }
        }
    }
}

#Preview {
    PagerText(text: TEST_STRING)
}
