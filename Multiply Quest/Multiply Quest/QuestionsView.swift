//
//  QuestionsView.swift
//  Multiply Quest
//
//  Created by Stoyan Hristov on 16.01.26.
//

import SwiftUI

struct QuestionsView: View {
    var questionCount: Int
    @Binding var questions: [Question]
    @Binding var answers: [String]
    @Binding var score: Int
    
    
    var body: some View {
        
        VStack {
            List{
                ForEach(0..<questions.count, id: \.self) {index in
                    HStack {
                        Text("\(questions[index].firstNumber)")
                        Text("ⓧ")
                        Text("\(questions[index].secondNumber)")
                        Text(" = ")
                        TextField("Answer", text: $answers[index])
                            .keyboardType(.numberPad)
                    }
                    .listRowBackground(questions[index].isWrong ? Color(.red): Color(.clear))
                    .foregroundStyle(questions[index].isWrong ? .white : .primary)
                }
            }
            .frame(width: 300, height: 600)
            .scrollContentBackground(.hidden)
    
            
            Button("Check answers") {
                for index in 0..<answers.count {
                    let answerAsInt = Int(answers[index]) ?? 0
                    
                    if answerAsInt == questions[index].correctanswer {
                        score += 1
                    } else {
                        questions[index].isWrong = true
                    }
                }
            }
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    previewQuestion()
}


struct previewQuestion: View {
    var questionCount: Int = 5
    @State var questions: [Question] = [Question(upTo: 12), Question(upTo: 10), Question(upTo: 5), Question(upTo: 8), Question(upTo: 4)]
    @State var answers: [String] = ["2", "15", "12", "16", "8"]
    @State var score: Int = 3
    
    var body: some View {
        QuestionsView(questionCount: 5, questions: $questions, answers: $answers, score: $score)
    }
}
