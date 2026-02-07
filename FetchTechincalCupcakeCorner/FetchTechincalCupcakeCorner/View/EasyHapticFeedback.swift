//
//  ContentView.swift
//  FetchTechincalCupcakeCorner
//
//  Created by Stoyan Hristov on 6.02.26.
//

import SwiftUI

struct EasyHapticFeedback: View {
    @State private var counter = 0
    var body: some View {
        VStack {
            Button("Tap me! Count: \(counter)") {
                counter += 1
            }
            //easiest and semantic option
//            .sensoryFeedback(.increase, trigger: counter)
            // flexability is the if the object hits it self and the material it is made of
            
//            .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: counter)
            
            // heavy is the weight of the object hittnig with diffrent intencityuǐdesBN
            .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
            .padding()
        }
    }
}

#Preview {
    EasyHapticFeedback()
}
