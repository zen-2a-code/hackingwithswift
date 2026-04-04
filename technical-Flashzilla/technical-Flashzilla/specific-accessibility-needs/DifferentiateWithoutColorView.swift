//
//  DifferentiateWithoutColorView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 2.04.26.
//

import SwiftUI

struct DifferentiateWithoutColorView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }

            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
    }
}

#Preview {
    DifferentiateWithoutColorView()
}
