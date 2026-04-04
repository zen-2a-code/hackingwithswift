//
//  EnhancedCountingElapsedSecondsUsingTimerView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 2.04.26.
//

internal import Combine
import SwiftUI

/// A view that demonstrates a controllable elapsed-seconds timer
/// with start, pause, stop, and reset functionality.
struct EnhancedCountingElapsedSecondsUsingTimerView: View {

    // MARK: - Timer

    /// The timer publisher — fires every second on the main run loop.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    // MARK: - State

    /// Counts elapsed seconds.
    @State private var elapsedSeconds = 0

    /// Controls whether ticks are counted. False when paused or stopped.
    @State private var isRunning = false

    /// Tracks whether the timer has ever been started (to distinguish stopped vs never started).
    @State private var hasStarted = false

    // MARK: - Body

    var body: some View {
        VStack(spacing: 24) {
            Text("Seconds passed: \(elapsedSeconds)")
                .font(.largeTitle)
                .onReceive(timer) { _ in
                    // Only increment when the timer is actively running
                    guard isRunning else { return }
                    elapsedSeconds += 1
                }

            HStack(spacing: 16) {
                // MARK: Start
                Button("Start") {
                    isRunning = true
                    hasStarted = true
                }
                .disabled(isRunning) // Greyed out while already running

                // MARK: Pause
                Button("Pause") {
                    isRunning = false
                }
                .disabled(!isRunning) // Only available while running

                // MARK: Stop
                Button("Stop") {
                    isRunning = false
                    hasStarted = false
                }
                .disabled(!hasStarted) // Only available after starting

                // MARK: Reset
                Button("Reset") {
                    isRunning = false
                    hasStarted = false
                    elapsedSeconds = 0
                }
                .disabled(elapsedSeconds == 0 && !hasStarted) // Nothing to reset
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    EnhancedCountingElapsedSecondsUsingTimerView()
}
