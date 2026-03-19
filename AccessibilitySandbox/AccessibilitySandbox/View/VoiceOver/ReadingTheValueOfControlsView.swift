//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Stoyan Hristov on 18.03.26.
//

import SwiftUI

struct ReadingTheValueOfControlsView: View {
    @State private var value = 10

       var body: some View {
           
           // not a good expireance reads everything sepreate and spams the action increment/decrement instead of saying the value.
//           VStack {
//               Text("Value: \(value)")
//
//               Button("Increment") {
//                   value += 1
//               }
//
//               Button("Decrement") {
//                   value -= 1
//               }
//           }
           
           VStack {
               Text("Value: \(value)")

               Button("Increment") {
                   value += 1
               }

               Button("Decrement") {
                   value -= 1
               }
           }
           .accessibilityElement()
           .accessibilityLabel("Value")
           .accessibilityValue(String(value))
           .accessibilityAdjustableAction { direction in
               switch direction {
               case .increment:
                   value += 1
               case .decrement:
                   value -= 1
               default:
                   print("Not handled.")
               }
           }
       }
}

#Preview {
    ReadingTheValueOfControlsView()
}
