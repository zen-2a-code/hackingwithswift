//
//  GestureSequencesView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

// Finally, SwiftUI lets us create gesture sequences, where one gesture will only become active if another gesture has first succeeded. This takes a little more thinking because the gestures need to be able to reference each other, so you can’t just attach them directly to a view.

struct GestureSequencesView: View {
    // how far the circle has been dragged
      @State private var offset = CGSize.zero

      // whether it is currently being dragged or not
      @State private var isDragging = false

      var body: some View {
          // a drag gesture that updates offset and isDragging as it moves around
          let dragGesture = DragGesture()
              .onChanged { value in
                  offset = value.translation
              }
              .onEnded { _ in
                  withAnimation {
                      offset = .zero
                      isDragging = false
                  }
              }

          // a long press gesture that enables isDragging, the intresting part here is hthat onEnded is executed not when released but when the LongPress duration is execeeded.
          let pressGesture = LongPressGesture()
              .onEnded { value in
                  withAnimation {
                      isDragging = true
                  }
              }

          // a combined gesture that forces the user to long press then drag
          let combined = pressGesture.sequenced(before: dragGesture)

          // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
          Circle()
              .fill(.red)
              .frame(width: 64, height: 64)
              .scaleEffect(isDragging ? 1.5 : 1)
              .offset(offset)
              .gesture(combined)
      }
}

#Preview {
    GestureSequencesView()
}
