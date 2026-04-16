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
                .fill(.gray.opacity(0.7))
            Text(String(diceNumber))
                .font(.system(size: 50))
                .foregroundStyle(Color.white)
        }
        .frame(width: 100, height: 100)
    }
}

struct DiceView: View {
    @Binding var dice: [Int]
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(dice.indices, id: \.self) {index in
                        SingleDiceView(diceNumber: dice[index])
                    }
                }
                .frame(minWidth: proxy.size.width)
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    DiceView(dice: .constant([12,13,51,42,69]))
}
