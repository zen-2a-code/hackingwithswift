//
//  DiceView.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import SwiftUI

private struct SingleDiceView: View {
    var diceNumber: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
            Text(String(diceNumber))
                .font(.system(size: 50))
                .foregroundStyle(Color.white)
        }
        .frame(width: 100, height: 100)
    }
}

struct DiceView: View {
    @Binding var dice: Roll
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(dice.rolledNumbers.indices, id: \.self) {index in
                    SingleDiceView(diceNumber: dice.rolledNumbers[index])
                }
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    DiceView(dice: .constant(Roll.example))
}
