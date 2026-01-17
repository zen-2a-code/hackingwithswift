//
//  ContentView.swift
//  Multiply Quest
//
//  Created by Stoyan Hristov on 15.01.26.
//

import SwiftUI

struct ContentView: View {
    @State private var isGameSetupDisplayed = true
    @State private var questions = [Question]()
    @State private var answers : Array<String> = []
    @State private var score: Int = 0
    @State var disableAnswerCheckButton: Bool = false
    @FocusState var isAnyTextFiledFocused: Bool
    
    @State private var questionsCount = 5
    @State private var upToNumber = 8
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isGameSetupDisplayed {
                    SetupView(upToNumber: $upToNumber, questionsCount: $questionsCount, questions: $questions, answers: $answers, isGameSetupDisplayed: $isGameSetupDisplayed)
                        .transition(.scale)
                } else {
                    QuestionsView(questionCount: questionsCount, questions: $questions, answers: $answers, score: $score, disableCheckButton: $disableAnswerCheckButton, isAnyTextFiledFocused: $isAnyTextFiledFocused)
                        .transition(.scale)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("New Game") {
                        withAnimation {
                            isGameSetupDisplayed.toggle()
                        }
                        answers.removeAll(keepingCapacity: false)
                        questions.removeAll(keepingCapacity: false)
                        score = 0
                        disableAnswerCheckButton = false
                    }
                    .fontWeight(.semibold)
                    .tint(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Score: \(score)")
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
