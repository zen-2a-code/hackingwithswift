//
//  CardView.swift
//  Flashzilla
//
//  Created by Stoyan Hristov on 5.04.26.
//

import SwiftUI

struct SlidingBackground: ViewModifier {
    let offset: CGSize
    @Environment(\.accessibilityDifferentiateWithoutColor) private var accessibilityDifferentiateWithoutColor
    
    func body(content: Content) -> some View {
        content.background(
            accessibilityDifferentiateWithoutColor
                        ? nil
            : offset.width == .zero ? nil : RoundedRectangle(cornerRadius: 25)
                            .fill(offset.width > 0 ? .green : .red)
        )
    }
}

extension View {
    func slidingBackground(offset: CGSize) -> some View {
        modifier(SlidingBackground(offset: offset))
    }
}

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) private var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) private var accessibilityVoiceOverEnabled
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    let card: Card
    var removal: (() -> Void)? = nil
    var addback: (() -> Void)? = nil

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor
                        ? .white
                        : .white
                            .opacity(1 - Double(abs(offset.width / 50)))
                )
                .slidingBackground(offset: offset)
                .shadow(radius: 10)

            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)

                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .animation(.bouncy, value: offset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width < 0 {
                            offset = .zero
                            addback?()
                        } else {
                            removal?()
                        }
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            withAnimation(.bouncy) {
                isShowingAnswer.toggle()
            }
        }
    }
}

#Preview {
    CardView(card: .example)
        .preferredColorScheme(.dark)
}
