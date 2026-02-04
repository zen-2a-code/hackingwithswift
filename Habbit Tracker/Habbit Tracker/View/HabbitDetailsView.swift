//
//  HabbitDetailsView.swift
//  Habbit Tracker
//
//  Created by Stoyan Hristov on 4.02.26.
//

import SwiftUI
import Lottie

struct HabbitDetailsView: View {
    var habbit: Habbit
    let habbits: Habbits
    @State private var habbitDescription = ""
    @State private var playbackMode: LottiePlaybackMode = .paused
    
    
    private var currentHabbitIndex: Int {
        return habbits.habbits.firstIndex { habbit in
            habbit == self.habbit
        } ?? 0
    }
    
    private var habbitCount: Int {
        habbits.habbits[currentHabbitIndex].completionCount
    }
    
    private var hasDesctiption: Bool {
        guard let descriptionText = habbits.habbits[currentHabbitIndex].description else {
            return false
        }
        return !descriptionText.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(habbitCount > 0 ? "Keep the good work going" : "Oh, repetion is the key.\nLet's do it together!")
                .font(.title2)
                .frame(minHeight: 30)
            Text("\(habbitCount)")
                .font(.title3)
                .foregroundStyle(.secondary)
            
            LottieView(animation: LottieAnimation.named("atom"))
                .playbackMode(playbackMode)
                .resizable()
                .frame(height: 170)
                .onTapGesture {
                    playbackMode = .playing(.toProgress(Double.random(in: 0..<100), loopMode: .playOnce))
                }
                .onAppear {
                    playbackMode = .playing(.toProgress(1, loopMode: .playOnce))
                }

            
            Button(habbitCount > 0 ? "Let's do it again" : "Let's do it" ) {
                habbits.habbits[currentHabbitIndex].completionCount += 1
            }
            
            if !hasDesctiption {
                Form {
                    Section("Missing habbit description") {
                        HStack {
                            TextField("Enter habbit description", text: $habbitDescription)
                            Button("Save", role: .confirm) {
                                habbits.habbits[currentHabbitIndex].description = habbitDescription
                            }
                        }
                    }
                }
                .frame(maxHeight: 90)
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
             
                    
            } else {
                Text("Habbit Description: ")
                
                ScrollView {
                    Text(habbits.habbits[currentHabbitIndex].description ?? "")
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle(habbit.title)
        .navigationBarTitleDisplayMode(.inline)
            
    }
}

#Preview {
//     let habbit: Habbit = Habbit(title: "Test", description: "This is a huge description, whith many rows This is a huge description, whith many rows This is a huge description, whith many rows This is a huge description, whith many rows This is a huge description, whith many rows ")
    
    let habbit: Habbit = Habbit(title: "Test", description: nil)
    let habbits = Habbits()
    habbits.habbits.append(habbit)
    
    return NavigationStack {
        HabbitDetailsView(habbit: habbit, habbits: habbits)
    }
}
