//
//  ScrollingText.swift
//  Reading
//
//  Created by Shawn Roller on 2/27/24.
//

import SwiftUI

struct VerticalScrollingText: View {
    var text: String

    var body: some View {
        ScrollView {
            Text(text)
        }
        .frame(depth: 15)
        .padding()
    }
}

#Preview {
    VerticalScrollingText(text: TEST_STRING)
}
