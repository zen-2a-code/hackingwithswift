//
//  RatingView.swift
//  Bookworm
//
//  Created by Stoyan Hristov on 12.02.26.
//

import SwiftUI

struct StarsRatingView: View {
    @Binding var selectedRating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) {ratingNumber in
                Button {
                    selectedRating = ratingNumber
                } label: {
                    startImage(for: ratingNumber)
                        .foregroundStyle(ratingNumber > selectedRating ? offColor : onColor)
                    // this accessibility settings are not bad, but they don't implement the native Voice over gestures
//                        .accessibilityLabel(ratingNumber == 1 ? "1 star" : "\(ratingNumber) stars")
//                        .accessibilityAddTraits(ratingNumber > selectedRating ? [] : [.isSelected])
                }
                .buttonStyle(.plain)
            }
        }
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityValue(selectedRating == 1 ? "1 star" : "\(selectedRating) stars")
        .accessibilityAdjustableAction {swipeDirection in
            switch swipeDirection {
                
            case .increment:
                if selectedRating < maximumRating {
                    selectedRating += 1
                }
            case .decrement:
                if selectedRating > 1 {
                    selectedRating -= 1
                }
            @unknown default:
                print("New option?")
            }
            
        }
    }
    
    func startImage(for currentRating: Int) -> Image {
        if currentRating > selectedRating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    StarsRatingView(selectedRating: .constant(4))
}
