//
//  ContentView.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var viewModel: ViewModel
    @State private var showHistorySheet = false

    init(modelContext: ModelContext) {
        _viewModel = State(initialValue: ViewModel(modelContext: modelContext))
    }
    var body: some View {

        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.purple, .pink]),
                startPoint: .top,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Button {
                        showHistorySheet = true
                    } label: {
                        Image(
                            systemName:
                                "clock.arrow.trianglehead.counterclockwise.rotate.90"
                        )
                    }
                    .buttonStyle(.glass)
                }
                Spacer()
                Spacer()

                DiceView(dice: $viewModel.rolls)
                    .animation(.bouncy, value: viewModel.rolls)
                if viewModel.showTotal {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white.opacity(0.3))
                        .frame(maxHeight: 150)
                        .overlay {
                            VStack {
                                Text("Total")
                                    .font(.subheadline.weight(.bold))
                                    .font(.title)
                                    .foregroundStyle(.secondary)
                                Text("\(viewModel.getTotalRolled())")
                                    .font(.system(size: 72))

                            }
                            .foregroundStyle(.white)
                        }

                }
                DiceConfigurationView(
                    diceCount: $viewModel.diceCount,
                    diceSidesCount: $viewModel.diceSides,
                    dicesSidesMaximumLimit: viewModel.diceSidesMaximumLimit,
                    diceCountMaximumLimit: viewModel.diceCountMaximumLimit
                )
                .disabled(viewModel.isRolling)

                Spacer()

                Button {
                    viewModel.rollDice()
                } label: {
                    Label("Roll", systemImage: "dice.fill")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.white.opacity(0.3))
                        .clipShape(.capsule)
                        .rotationEffect(.degrees(viewModel.isRolling ? 360 : 0))
                        .animation(.easeInOut, value: viewModel.isRolling)
                }
                .buttonStyle(.plain)
                .disabled(viewModel.isRolling)

                Spacer()

            }
            .padding()
            .sheet(isPresented: $showHistorySheet) {
                RollHistoryView()
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(
        for: Roll.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    ContentView(modelContext: container.mainContext)
        .modelContainer(container)
}
