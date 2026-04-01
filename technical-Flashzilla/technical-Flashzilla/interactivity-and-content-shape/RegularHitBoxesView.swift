//
//  RegularHitBoxesView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

struct RegularHitBoxesView: View {
    var body: some View {
        // If you try that out, you’ll find that tapping inside the circle prints “Circle tapped”, but on the rectangle behind the circle prints “Rectangle tapped” – even though the circle actually has the same frame as the rectangle.
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
                .onTapGesture {
                    print("Circle tapped!")
                }
        }
    }
}

#Preview {
    RegularHitBoxesView()
}
