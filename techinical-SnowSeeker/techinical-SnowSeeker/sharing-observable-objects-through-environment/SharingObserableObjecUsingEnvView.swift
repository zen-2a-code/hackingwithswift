//
//  SharingObserableObjecUsingEnvView.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player

    var body: some View {
        // workaround in order to make obj from env binding
        @Bindable var player = player
        Stepper("High score: \(player.highScore)", value: $player.highScore)
    }
}

struct SharingObserableObjecUsingEnvView: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView()
        }
        .environment(player)
    }
}

#Preview {
    SharingObserableObjecUsingEnvView()
}
