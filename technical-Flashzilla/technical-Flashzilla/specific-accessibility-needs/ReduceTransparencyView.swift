//
//  ReduceTransparencyView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 2.04.26.
//

import SwiftUI

struct ReduceTransparencyView: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    ReduceTransparencyView()
}
