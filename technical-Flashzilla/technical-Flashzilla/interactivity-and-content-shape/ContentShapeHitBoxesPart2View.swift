//
//  ContentShapeHitBoxesPart2View.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

struct ContentShapeHitBoxesPart2View: View {
    
    // If you run that you’ll find you can tap the “Hello” label and the “World” label, but not the space in between. However, if we use contentShape(.rect) on the VStack then the whole area for the stack becomes tappable, including the spacer:
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .border(.blue)
        .contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    ContentShapeHitBoxesPart2View()
}
