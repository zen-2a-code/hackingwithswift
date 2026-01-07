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
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 20
        
        return Calendar.current.date(from: components) ?? .now
        
    }
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
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
            }
            .navigationBarTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK 😴") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hourInSeconds = (components.hour ?? 0) * 60 * 60
            let minutesInSeconds = (components.minute ?? 0) * 60
            
            // How much sleep the user actually needs to sleep
            let modelPrediction = try model.prediction(wake: Double(hourInSeconds + minutesInSeconds), estimatedSleep: estimateNeededSleepInHours, coffee: Double(coffeIntakeAmount))
            
            let bedTime = wakeUp - modelPrediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = "\(bedTime.formatted(date: .omitted, time: .shortened))"
            
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        showingAlert = true
    }
}


#Preview {
    ContentView()
}
