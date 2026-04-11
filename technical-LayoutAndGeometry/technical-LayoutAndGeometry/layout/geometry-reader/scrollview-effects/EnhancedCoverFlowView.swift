//
//  CoverFlowView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 11.04.26.
//

import SwiftUI

struct EnhancedCoverFlowView: View {
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1..<20) { num in
                        GeometryReader { proxy in
                            let minX = proxy.frame(in: .global).minX
                            let rotation = -minX / 8

                            Text("Number \(num)")
                                .font(.largeTitle)
                                .padding()
                                .background(.red)
                                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                                .frame(width: 200, height: 200)
                                .onChange(of: minX) { oldValue, newValue in
                                    print("Card \(num) — minX: \(newValue), rotation: \(-newValue / 8)°")
                                }
                        }
                        .frame(width: 200, height: 200)
                    }
                }
            }
        }}

#Preview {
    EnhancedCoverFlowView()
}
