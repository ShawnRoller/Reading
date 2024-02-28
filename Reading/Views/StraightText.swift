//
//  StraightText.swift
//  Reading
//
//  Created by Shawn Roller on 2/27/24.
//

import SwiftUI

struct StraightText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
    }
}

#Preview {
    StraightText(text: TEST_STRING)
}
