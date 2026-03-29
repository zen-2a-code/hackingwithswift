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
    
    let labels: [String: String] = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner.",
        "Bulgaria": "Flag with three horizontal stripes. Top stripe white, middle stripe green, bottom stripe red.",
    ]
    
    @State private var currentAnswerFlagIndex = Int.random(in: 0 ... 2)
    @State private var selectedFlagIndex: Int?
    
    @State private var isShowingScoreAlertDisplayed = false
    @State private var isShowingGameOverAlertDisplayed = false
    
    @State private var scoreTitle = ""
    @State private var scoreValue = 0
    @State private var turnsCount: Int = 0
    
    private var getFlagOpacity = { (currentFlagIndex: Int, selectedFlagIndex: Int?) -> Double in
        if selectedFlagIndex == nil || selectedFlagIndex == currentFlagIndex {
            return 1.0
        } else {
            return 0.25
        }
    }
    
    private var getFlagScale = { (currentFlagIndex: Int, selectedFlagIndex: Int?) -> Double in
        if selectedFlagIndex == nil || selectedFlagIndex == currentFlagIndex {
            return 1
        } else {
            return 0.45
        }
    }
    
    private var alertMesssage: String {
        if scoreTitle == "Wrong" {
            return "That's the flag of \(countries[selectedFlagIndex ?? 0 ]).\nYour score is \(scoreValue)"
        } else {
            return "Your score is \(scoreValue)"
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 290, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Text("Guess the flag")
                    .font(.largeTitle).bold()
                    .foregroundStyle(.regularMaterial)
                    .fontDesign(.serif)
                
                VStack(spacing: 22) {
                    VStack {
                        Text("Tap the flag of:")
                            .foregroundStyle(.primary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[currentAnswerFlagIndex])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0 ..< 3) { currentFlagIndex in
                        Button {
                            withAnimation {
                                flagTapped(currentFlagIndex)
                            }
                        } label: {
                            FlagImage(flagName: countries[currentFlagIndex])
                                .accessibilityLabel(labels[countries[currentFlagIndex], default: "Unknown flag"])
                        }
                        .rotation3DEffect(Angle(degrees: selectedFlagIndex == currentFlagIndex ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(getFlagOpacity(currentFlagIndex, selectedFlagIndex))
                        .scaleEffect(getFlagScale(currentFlagIndex, selectedFlagIndex))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .glassEffect(.clear.interactive(), in: .rect(cornerRadius: 20))
                .padding()
                
                Text("Score: \(scoreValue)")
                    .font(Font.title.weight(.semibold))
                    .foregroundStyle(.thinMaterial)
            }
         }
        
        .alert("Game over", isPresented: $isShowingGameOverAlertDisplayed, actions: {
            Button("Restart", role: .confirm) {
                scoreValue = 0
                turnsCount = 0
                scoreTitle = ""
            }
        }, message: {
            Text("The game has ended.\nYour score is: \(scoreValue)")
                .multilineTextAlignment(.leading)
        })
        .alert(scoreTitle, isPresented: $isShowingScoreAlertDisplayed) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(alertMesssage)
        }
    }
    
    func flagTapped(_ currentFlagIndex: Int) {
        turnsCount += 1
        
        if currentFlagIndex == currentAnswerFlagIndex {
            scoreValue += 1
            scoreTitle = "Correct"
            selectedFlagIndex = currentFlagIndex
        } else {
            scoreValue -= 1
            scoreTitle = "Wrong"
            selectedFlagIndex = currentFlagIndex
        }
        
        isShowingScoreAlertDisplayed = true
        
        if turnsCount >= 8 { isShowingGameOverAlertDisplayed = true }
     }
    
    func askQuestion() {
        countries.shuffle()
        currentAnswerFlagIndex = Int.random(in: 0 ... 2)
        selectedFlagIndex = nil
    }
}

struct FlagImage: View {
    let flagName: String
    
    var body: some View {
        Image(flagName)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}
