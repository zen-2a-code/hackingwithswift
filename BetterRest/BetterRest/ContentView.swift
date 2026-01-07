//
//  ContentView.swift
//  BetterRest
//
//  Created by Stoyan Hristov on 5.01.26.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeUpTime
    @State private var estimateNeededSleepInHours = 8.0
    @State private var coffeIntakeAmount = 1
    
    private var bedTime: String {
        return calculateBedTime()
    }
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 20
        
        return Calendar.current.date(from: components) ?? .now
     }
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time for wake up:", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(estimateNeededSleepInHours.formatted()) hours", value: $estimateNeededSleepInHours, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper("^[\(coffeIntakeAmount) cup](inflect: true)", value: $coffeIntakeAmount, in: 0...20)
                }
                
                Section {
                    HStack {
                        Text("Your recommended bedtime is: \(bedTime)")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
    
    func calculateBedTime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
                
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hourInSeconds = (components.hour ?? 0) * 60 * 60
            let minutesInSeconds = (components.minute ?? 0) * 60
                
            // How much sleep the user actually needs to sleep
            let modelPrediction = try model.prediction(wake: Double(hourInSeconds + minutesInSeconds), estimatedSleep: estimateNeededSleepInHours, coffee: Double(coffeIntakeAmount))
                
            let bedTime = wakeUp - modelPrediction.actualSleep
                
            return "\(bedTime.formatted(date: .omitted, time: .shortened))"
                
        } catch {
            return ""
        }
    }
}

#Preview {
    ContentView()
}
