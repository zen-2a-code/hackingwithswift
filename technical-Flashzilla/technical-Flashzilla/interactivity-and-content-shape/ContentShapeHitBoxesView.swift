//
//  ContentShapeHitBoxesView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

struct ContentShapeHitBoxesView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }

            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(.rect)
                .onTapGesture {
                    print("Circle tapped!")
                }
        }
    }
}

#Preview {
    ContentShapeHitBoxesView()
}
