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
    
    @State private var questionsCount = 5
    @State private var upToNumber = 8
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isGameSetupDisplayed {
                    SetupView(upToNumber: $upToNumber, questionsCount: $questionsCount, questions: $questions, answers: $answers, isGameSetupDisplayed: $isGameSetupDisplayed)
                } else {
                    QuestionsView(questionCount: questionsCount, questions: $questions, answers: $answers, score: $score)
                }
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("New Game") {
                        isGameSetupDisplayed.toggle()
                        answers.removeAll(keepingCapacity: false)
                        questions.removeAll(keepingCapacity: false)
                        score = 0
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
