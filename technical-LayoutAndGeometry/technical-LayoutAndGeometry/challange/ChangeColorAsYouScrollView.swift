//
//  ChangeColorAsYouScrollView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 12.04.26.
//

import SwiftUI

struct ChangeColorAsYouScrollView: View {
    let colors: [Color] = [
        .red, .green, .blue, .orange, .pink, .purple, .yellow,
    ]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let fraction =
                            proxy.frame(in: .global).minY / fullView.size.height

                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color(
                                    hue: fraction,
                                    saturation: 0.8,
                                    brightness: 0.9
                                )
                            )
                            .opacity(
                                Double(proxy.frame(in: .global).minY * 0.005)
                            )
                            .rotation3DEffect(
                                .degrees(
                                    proxy.frame(in: .global).minY - fullView
                                        .size.height / 2
                                ) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .animation(.easeInOut, value: fraction)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ChangeColorAsYouScrollView()
}
