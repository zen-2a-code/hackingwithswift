//
//  SetupView.swift
//  Multiply Quest
//
//  Created by Stoyan Hristov on 15.01.26.
//

import SwiftUI

struct SetupView: View {
    @Binding var upToNumber: Int
    @Binding var questionsCount: Int
    @Binding var questions: [Question]
    @Binding var answers: [String]
    @Binding var isGameSetupDisplayed: Bool

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
                    Text("20").tag(20)
                }
            }
            Button("Let's play") {
            
                
                for _ in 1...questionsCount {
                    questions.append(Question.init(upTo: upToNumber))
                }
                
                answers = Array(repeating: "", count: questionsCount)
                
                withAnimation {
                    isGameSetupDisplayed = false
                }
            }
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
            .fontWeight(.semibold)
            .tint(.brown)
        }
        .scrollContentBackground(.automatic)
        .toolbarVisibility(.hidden)

    }
}

#Preview {
    SetupViewPreviewWrapper()
}

private struct SetupViewPreviewWrapper: View {
    @State private var upToNumber: Int = 0
    @State private var questionsCount: Int = 0
    @State var questions: [Question] = []
    @State var answers: [String] = []
    @State var isGameSetupDisplayed: Bool = true

    var body: some View {
            SetupView(upToNumber: $upToNumber, questionsCount: $questionsCount, questions: $questions, answers: $answers, isGameSetupDisplayed: $isGameSetupDisplayed)

            Text("upToNumber: \(upToNumber)")
            Text("questionsCount: \(questionsCount)")
    }
}
