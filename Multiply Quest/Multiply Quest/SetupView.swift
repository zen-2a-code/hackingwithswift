//
//  SetupView.swift
//  Multiply Quest
//
//  Created by Stoyan Hristov on 15.01.26.
//

import SwiftUI

struct SetupView: View {
    @State var upToNumber = 7
    @State var questionsCount = 10
    
    var submitSettings: (Int, Int) -> Void

    var body: some View {
        
        Form {
            Section ("Select upper number: ") {
                Stepper("\(upToNumber)",
                        value: $upToNumber, in: 2...12)
            }
            Section ("Select questions count:") {
                Picker("Select questions count:", selection: $questionsCount) {
                    Text("5").tag(5)
                    Text("10").tag(10)
                    Text("15").tag(15)
                }
            }
            Button("Let's play") {
                submitSettings(upToNumber, questionsCount)
            }
            .buttonStyle(.borderedProminent)
            .fontWeight(.semibold)
            .tint(.orange)
        }
        .scrollContentBackground(.automatic)
        

    }
}

#Preview {
    SetupViewPreviewWrapper()
}

private struct SetupViewPreviewWrapper: View {
    @State private var firstNumber: Int = 0
    @State private var secondNumber: Int = 0

    var body: some View {
            SetupView { a, b in
                firstNumber = a
                secondNumber = b
            }

            Text("upToNumber: \(firstNumber)")
            Text("questionsCount: \(secondNumber)")
    }
}
