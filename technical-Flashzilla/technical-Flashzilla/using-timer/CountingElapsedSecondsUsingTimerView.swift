//
//  CountingElapsedSecondsUsingTimerView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

internal import Combine
import SwiftUI

struct CountingElapsedSecondsUsingTimerView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var elapsedSeconds = 0
    var body: some View {
        Text("Seconds passed: \(elapsedSeconds)")
            .onReceive(timer) { _ in
               elapsedSeconds += 1
            }
    }
}

#Preview {
    CountingElapsedSecondsUsingTimerView()
}
