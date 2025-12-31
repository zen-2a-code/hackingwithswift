//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Stoyan Hristov on 30.12.25.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var countries = ["Bulgaria", "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()

    @State private var currentAnswerFlagIndex = Int.random(in: 0 ... 2)

    @State private var isShowingScoreAlertDisplayed = false
    @State private var scoreTitle = ""
    @State private var scoreValue = 0

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of:")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[currentAnswerFlagIndex])
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                }

                ForEach(0 ..< 3) { currentFlagIndex in
                    Button {
                        flagTapped(currentFlagIndex)
                    } label: {
                        Image(countries[currentFlagIndex])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $isShowingScoreAlertDisplayed) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(scoreValue)")
        }
    }
    
    func flagTapped(_ currentFlagIndex: Int) {
        if currentFlagIndex == currentAnswerFlagIndex {
            scoreValue += 1
            scoreTitle = "Correct"
        } else {
            scoreValue -= 1
            scoreTitle = "Wrong"
        }
        
        isShowingScoreAlertDisplayed = true
    }
    
    func askQuestion() {
        countries.shuffle()
        currentAnswerFlagIndex = Int.random(in: 0 ... 2)
    }
}

#Preview {
    ContentView()
}
