//
//  DiceSidesSelectorView.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import SwiftUI

struct DiceSidesSelectorView: View {
    @Binding var diceCount: Int
    @Binding var diceSidesCount: Int
    var body: some View {
        VStack {
            Stepper("Dice count: \(diceCount)", value: $diceCount)
            Stepper("Dice sides: \(diceSidesCount)", value: $diceSidesCount)
        }
    }
}

#Preview {
    @Previewable @State var diceCount = 1
    @Previewable @State var diceSides = 6
    DiceSidesSelectorView(diceCount: $diceCount, diceSidesCount: $diceSides)
}
