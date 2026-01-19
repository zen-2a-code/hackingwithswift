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
    @Binding var disableCheckButton: Bool
    @FocusState<Bool>.Binding var isAnyTextFiledFocused: Bool
    
    
    var body: some View {
        VStack {
            List{
                ForEach(0..<questions.count, id: \.self) {index in
                    HStack {
                        HStack {
                            Text("\(questions[index].firstNumber)")
                            Text("ⓧ")
                            Text("\(questions[index].secondNumber)")
                            Text(" = ")
                        }.frame(width: 90)
                        TextField("Answer", text: $answers[index])
                            .keyboardType(.numberPad)
                            .frame(width: 70)
                            
                        
                        if questions[index].isWrong {
                            Text("Correct answer: \(questions[index].correctanswer)")
                                .font(.caption)
                        }
                    }
                    .focused($isAnyTextFiledFocused)
                    .listRowSpacing(18)
                    .listRowBackground(getAnswerStatusColor(index: index))
                    .foregroundStyle(questions[index].isWrong ? .white : .primary)
                    .animation(.easeOut, value: questions.map(\.isWrong))
                }
            }
            .frame(width: 370)
            .scrollContentBackground(.hidden)
            .scrollDismissesKeyboard(.interactively)
            
            Button("Check answers") {
                disableCheckButton = true
                
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
                .tint(.brown)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .disabled(disableCheckButton)
        }
    }
    
    func getAnswerStatusColor(index: Int) -> Color {
        if disableCheckButton {
            if questions[index].isWrong {
                return .red
            } else {
                return .green
            }
        } else {
            return .clear
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
    @State var disableAnswerCheckButton: Bool = false
    @FocusState var isAnyTextFiledFocused: Bool
    
    var body: some View {
        QuestionsView(questionCount: 5, questions: $questions, answers: $answers, score: $score, disableCheckButton: $disableAnswerCheckButton, isAnyTextFiledFocused: $isAnyTextFiledFocused)
    }
}
