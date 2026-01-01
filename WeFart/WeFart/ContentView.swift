//
//  ContentView.swift
//  WeFart
//
//  Created by Stoyan Hristov on 1.01.26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("fartCount") private var fartCount: Int = 0

    let poopGradient = [
        Color(red: 0.22, green: 0.15, blue: 0.10),
        Color(red: 0.38, green: 0.26, blue: 0.18),
        Color(red: 0.52, green: 0.37, blue: 0.25)
    ]

    var body: some View {
        ZStack {
            LinearGradient(colors: poopGradient, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("WeFart")
                    .font(.title)
                    .foregroundStyle( .brown)
                    .fontDesign(.serif)
                
                Spacer()
                
                Button {
                    fartCount += 1
                } label: {
                    Label("Wasn't me", systemImage: "wind.circle.fill")
                        .symbolEffect(.bounce , value: fartCount)
                        .foregroundStyle(.white)
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(.brown)

                Text("You have farted: \(fartCount) times. Great job!")
                    .foregroundStyle(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
