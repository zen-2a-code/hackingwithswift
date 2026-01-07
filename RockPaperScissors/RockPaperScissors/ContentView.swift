//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Stoyan Hristov on 4.01.26.
//

import SwiftUI

struct ContentView: View {
    private let choices = ["✊", "👋", "✌️"]
    @State private var score = 0
    @State private var appChoice: String = "✊"
    @State private var isShouldWin: Bool = true
    @State private var gameCount = 1
    @State private var showGameOver: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [ Color(hex: "#312E81"), Color(Color(hex: "#2563EB"))], startPoint: .top, endPoint: .bottom)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Score: \(score)")
                Text("App choice: \(appChoice)")
                    .font(.system(size: 40))
                Text("You should: \(isShouldWin ? "WIN" : "Lose")")
                
                ForEach(choices, id: \.self) { currentPlayerChoice in
                    Button {
                        if currentPlayerChoice == appChoice {
                            score -= 1
                        } else {
                            switch currentPlayerChoice {
                            case "✊":
                                checkChoiceAddToScore(playerChoice: currentPlayerChoice, losingFrom: "👋")
                            case "✌️":
                                checkChoiceAddToScore(playerChoice: currentPlayerChoice, losingFrom: "✊")
                            case "👋":
                                checkChoiceAddToScore(playerChoice: currentPlayerChoice, losingFrom: "✌️")
                            default:
                                {}()
                            }
                        }
                    } label: {
                        Text("\(currentPlayerChoice,)")
                            .font(.system(size: 50))
                    }
                }
            }
            .foregroundStyle(.white)
    
        }
        .alert("Game Over", isPresented: $showGameOver) {
            Button("Play again") {
                showGameOver = false
                score = 0
                gameCount = 1
                appChoice = getRandomElement()
                isShouldWin = Bool.random()
            }
        } message: {
            Text("Your score is \(score)")
        }
        
        .task {
            appChoice = getRandomElement()
            isShouldWin = Bool.random()
        }
        .onChange(of: score) {
            if gameCount == 10 {
                showGameOver = true
            }
            appChoice = getRandomElement()
            isShouldWin = Bool.random()
            gameCount += 1
            
            
        }
    }

    func getRandomElement() -> String { choices[Int.random(in: 0 ..< choices.count)] }
    
    func checkChoiceAddToScore(playerChoice: String, losingFrom: String ) {
        let isLoss = appChoice == losingFrom
        if isShouldWin {
            if isLoss {
                score -= 1
            } else {
                score += 1
            }
        } else {
            if isLoss {
                score += 1
            } else {
                score -= 1
            }
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    ContentView()
}
