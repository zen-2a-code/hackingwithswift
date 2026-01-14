//
//  ContentView.swift
//  Animations
//
//  Created by Stoyan Hristov on 12.01.26.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let rotatingDegress: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotatingDegress), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(rotatingDegress: -90, anchor: .topLeading), identity: CornerRotateModifier(rotatingDegress: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var isShowRed = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
