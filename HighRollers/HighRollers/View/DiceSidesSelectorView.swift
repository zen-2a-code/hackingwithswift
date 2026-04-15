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
    let dicesSidesMaximumLimit: Int
    let diceCountMaximumLimit: Int
    var body: some View {
        VStack {
            Stepper("Dice count: \(diceCount)", value: $diceCount, in: 1...diceCountMaximumLimit)
            Stepper("Dice sides: \(diceSidesCount)", value: $diceSidesCount, in: 1...diceCountMaximumLimit)
        }
        .frame(width: 230, height: 90)
        .animation(.easeInOut, value: diceCount)
        .animation(.bouncy, value: diceSidesCount)
    }
}

#Preview {
    @Previewable @State var diceCount = 1
    @Previewable @State var diceSides = 6
    
    let dicesSidesMaximumLimit: Int = 100
    let diceCountMaximumLimit: Int = 133
    
    DiceSidesSelectorView(diceCount: $diceCount, diceSidesCount: $diceSides, dicesSidesMaximumLimit: dicesSidesMaximumLimit, diceCountMaximumLimit:  diceCountMaximumLimit)
        .frame(height: 80)
}
