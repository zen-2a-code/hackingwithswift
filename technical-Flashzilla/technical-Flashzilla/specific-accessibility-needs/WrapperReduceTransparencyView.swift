//
//  WrapperReduceTransparencyView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 2.04.26.
//

import SwiftUI

struct WrapperReduceTransparencyView: View {
    @State private var scale = 1.0
    
    var body: some View {
        Button("Hello, World!") {
            withOptionalAnimation {
                scale *= 1.5
            }

        }
        .scaleEffect(scale)
    }
    
    func withOptionalAnimation<T>(_ animation: Animation? = .default, _ body: () throws -> T) rethrows -> T {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

#Preview {
    WrapperReduceTransparencyView()
}
