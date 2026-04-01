//
//   SimultaneousGestureView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

struct _SimultaneousGestureView: View {
    var body: some View {
          VStack {
              Text("Hello, World!")
                  .onTapGesture {
                      print("Text tapped")
                  }
          }
          .simultaneousGesture(
              TapGesture()
                  .onEnded {
                      print("VStack tapped")
                  }
          )
      }
}

#Preview {
    _SimultaneousGestureView()
}
