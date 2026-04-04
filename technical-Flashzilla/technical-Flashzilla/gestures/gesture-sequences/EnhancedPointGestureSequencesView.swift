//
//  GestureSequenceView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

/// Demonstrates how to combine gestures using a sequence:
/// First a long press must succeed, then a drag is allowed.
/// Extracts gestures into computed properties for better readability and reuse.
struct EnhancedPointGestureSequencesView: View {
    
    /// Current drag offset of the circle
    @State private var offset = CGSize.zero
    
    /// Saved offset at the end of each drag, used as the base for the next one
    @State private var lastOffset = CGSize.zero
    
    /// Indicates whether the user has successfully long-pressed
    @State private var isDragging = false
    
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combinedGesture)
    }
    
    /// Drag gesture that updates position and resets state when finished
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                // Add live translation on top of where the circle last stopped
                offset = CGSize(
                    width: lastOffset.width + value.translation.width,
                    height: lastOffset.height + value.translation.height
                )
            }
            .onEnded { _ in
                // Save current position so the next drag starts from here
                lastOffset = offset
                withAnimation {
                    isDragging = false
                }
            }
    }
    
    /// Long press gesture that enables dragging
    private var pressGesture: some Gesture {
        LongPressGesture()
            .onEnded { _ in
                withAnimation {
                    isDragging = true
                }
            }
    }
    
    /// Combined gesture: requires long press before drag
    private var combinedGesture: some Gesture {
        pressGesture.sequenced(before: dragGesture)
    }
}

#Preview {
    EnhancedPointGestureSequencesView()
}
