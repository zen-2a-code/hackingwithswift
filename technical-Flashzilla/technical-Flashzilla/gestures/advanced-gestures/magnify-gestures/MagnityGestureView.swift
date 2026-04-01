//
//  MagnityGestureView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

// For more advanced gestures we should use the gesture() modifier with one of the gesture structs: DragGesture, LongPressGesture, MagnifyGesture, RotateGesture, and TapGesture.
struct MagnityGestureView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0

    var body: some View {
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }.onEnded { _ in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

#Preview {
    MagnityGestureView()
}
