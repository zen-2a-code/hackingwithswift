//
//  ContentView.swift
//  Animations
//
//  Created by Stoyan Hristov on 12.01.26.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 1.0
    var body: some View {
        Button {
        
        } label: {
            Text("Tap me")
                .padding(50)
                .background(.red)
                .clipShape(.circle)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
        }
        .overlay {
            Circle()
                .stroke(.red)
                .scaleEffect(scale)
                .opacity(2 - scale)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: scale
                )
        }
        .onAppear {
                scale = 2.0
            }
    }
}

#Preview {
    ContentView()
}
