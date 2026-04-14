//
//  DiceView.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import SwiftUI

struct DiceView: View {
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

struct DicesView: View {
    @Binding var dices: Roll
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(dices.rolledNumbers.indices, id: \.self) {index in
                    DiceView(diceNumber: dices.rolledNumbers[index])
                }
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    DicesView(dices: .constant(Roll.example))
}
