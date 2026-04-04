//
//  ReduceMotionView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 2.04.26.
//

import SwiftUI

struct ReduceMotionView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0

     var body: some View {
         Button("Hello, World!") {
             if reduceMotion {
                 scale *= 1.5
             } else {
                 withAnimation {
                     scale *= 1.5
                 }
             }

         }
         .scaleEffect(scale)
     }
}

#Preview {
    ReduceMotionView()
}
