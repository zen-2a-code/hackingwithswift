//
//  TrigeringEventsUsingTimerView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

internal import Combine
import SwiftUI

struct TrigeringEventsUsingTimerView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var counter = 0
    var body: some View {
        Text("Hello World!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                counter += 1
            }
    }
}

#Preview {
    TrigeringEventsUsingTimerView()
}
