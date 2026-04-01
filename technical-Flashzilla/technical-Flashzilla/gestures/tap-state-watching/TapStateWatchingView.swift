//
//  LongTabView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

struct TapStateWatchingView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        // the body of the gesture is only executed if minimum duration is exeited
            .onLongPressGesture(minimumDuration: 3) {
                print("This text is longed tapped!")
            // this closure is called whenever gesture is started and when released
            } onPressingChanged: { isPressed in
                print("Is pressed: \(isPressed)")
            }
    }
}

#Preview {
    TapStateWatchingView()
}
