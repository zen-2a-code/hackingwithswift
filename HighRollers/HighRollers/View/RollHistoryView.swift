//
//  RollHistory.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import SwiftData
import SwiftUI

struct RollHistoryView: View {
    @Query(sort: \Roll.createdAt, order: .forward) private var rolls: [Roll]
    
    
    var body: some View {
        List(rolls) { roll in
            HStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text("Total:")
                        .foregroundStyle(.secondary)
                        .font(.callout)
                    Text("\(roll.total)")
                        .font(.largeTitle)
                }
                .frame(minWidth: 80)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "dice")
                        Text("d\(roll.diceSides)")
                    }
                    HStack {
                        Image(systemName: "numbersign")
                        Text("x\(roll.diceCount)")
                    }
                }
                VStack {
                    Text("Numbers rolled: ")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Text(getRolledNumbersAsString(roll))
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
                
            }
        }
        .onAppear {
            print(rolls.count)
        }
    }
    
    func getRolledNumbersAsString(_ roll: Roll) -> String {
        roll.rolledNumbers.map(String.init).joined(separator: ", ")
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Roll.self, configurations: config)
    
    for roll in [Roll.example, Roll(rolledNumber: [69,42,12,15,10,23,11,55,12,7,8,12,420], diceSides: 6, diceCount: 12), Roll.example] {
        container.mainContext.insert(roll)
    }
    
    return RollHistoryView()
        .modelContainer(container)
}
