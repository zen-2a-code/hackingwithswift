//
//  AdjustScaleOnVerticalPositionView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 12.04.26.
//

import SwiftUI

struct AdjustScaleOnVerticalPositionView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .opacity(Double(proxy.frame(in: .global).minY * 0.005))
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .scaleEffect( 0.5 + Double(proxy.frame(in: .global).minY / fullView.size.height) * 1)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    AdjustScaleOnVerticalPositionView()
}
