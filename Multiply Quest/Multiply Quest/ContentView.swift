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
    
    @State private var questionCount = 5
    @State private var upToNumber = 8
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isGameSetupDisplayed {
                    SetupView(submitSettings: gameSetup)
                } else {
                    QuestionsView(questionCount: questionCount, questions: $questions, answers: answers, onAnsweringQuestion: onAnsweringQuestions)
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
    func gameSetup(highestNum: Int, qCount: Int){
        upToNumber = highestNum
        questionCount = qCount
        
        for _ in 1...questionCount {
            questions.append(Question.init(upTo: upToNumber))
        }
        
        answers = Array(repeating: "", count: questionCount)
        
        isGameSetupDisplayed = false
    }
    
    func onAnsweringQuestions( studentAnswers: [String]) -> Void {
        answers = studentAnswers
        
        for index in 0..<answers.count {
            let answerAsInt = Int(answers[index]) ?? 0
            
            if answerAsInt == questions[index].correctanswer {
                score += 1
            } else {
                questions[index].isWrong = true
            }
        }
        
    }
}


#Preview {
    ContentView()
}
