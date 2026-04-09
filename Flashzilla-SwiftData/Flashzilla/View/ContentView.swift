//  ContentView.swift
//  Flashzilla
//
//  Created by Stoyan Hristov on 4.04.26.
//

import SwiftUI
import SwiftData
internal import Combine

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
            return self.offset(y: offset * 10)
    }
}

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Card.createdAt, order: .forward) private var allCards: [Card] = []
    @State private var isActive = true
    @State private var seassionCards: [Card] = []
    @State private var showingEditScreen = false
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                ZStack {
                    ForEach(seassionCards, id: \.id) { card in
                        CardView(card: card) {
                            withAnimation {
                                removeCard(card)
                            }
                        } addback: {
                            withAnimation {
                                addCardBackToDeck(card)
                            }
                        }
                        .allowsHitTesting(seassionCards.last?.id == card.id)
                        .accessibilityHidden(seassionCards.last?.id != seassionCards.last?.id)
                        .stacked(at: seassionCards.firstIndex(of: card) ?? 0, in: seassionCards.count)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                
                if seassionCards.isEmpty || timeRemaining == 0 {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                        .padding(.top, 20)
                }
            }
            
            VStack {
                HStack {
                    Spacer()

                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }

                Spacer()
            }
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
            
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            withAnimation {
                                removeCard(seassionCards[seassionCards.count - 1])
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")

                        Spacer()

                        Button {
                            withAnimation {
                                removeCard(seassionCards[seassionCards.count - 1])
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        // outdated - use closure
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCardsView.init)
        .onAppear(perform: resetCards)
        .onReceive(timer) { time in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                if !seassionCards.isEmpty {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
    }
    
    func removeCard(_ card: Card) {
        guard let index = seassionCards.lastIndex(of: card) else { return }
        guard index >= 0 else { return }
        seassionCards.remove(at: index)
        
        if seassionCards.isEmpty {
            isActive = false
        }
    }
    
    func addCardBackToDeck(_ card: Card) {
        let newCard = Card(prompt: card.prompt, answer: card.answer)
        seassionCards.insert(newCard, at: 0)
        removeCard(card)
    }
    
    func resetCards() {
        timeRemaining = 100
        seassionCards = allCards
        isActive = true
    }
}

#Preview {
    ContentView()
}
