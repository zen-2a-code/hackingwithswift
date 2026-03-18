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
                }
                .buttonStyle(.plain)
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
