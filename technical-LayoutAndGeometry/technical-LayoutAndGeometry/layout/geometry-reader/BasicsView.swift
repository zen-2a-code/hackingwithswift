//
//  basics.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 11.04.26.
//

import SwiftUI

// MARK: - Without GeometryReader (fragile)

struct HardcodedCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.blue)
            .frame(width: 300, height: 180) // 🚨 Hardcoded - breaks on different screens
    }
}

// MARK: - With GeometryReader (adaptive)

struct AdaptiveCard: View {
    var body: some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 16)
                .fill(.green)
            
                // Always 90% wide, 30% tall — whatever screen we're on
                .frame(width: proxy.size.width * 0.9, height: proxy.size.height * 0.3)
                .frame(maxWidth: .infinity) // centers inside the GeometryReader (default aligment for grame is center) 
                // wraps that entire box in a new invisible container that stretches to full width. That container then centers its content (your already-sized rectangle) horizontally.
                // Think of it like putting a photo in a frame, then putting that frame on a wide shelf. The shelf doesn't resize the photo — it just positions the frame on it.
        }
    }
}

// MARK: - Side by side demo

struct BasicsView: View {
    var body: some View {
        VStack(spacing: 40) {

            VStack {
                Text("Hardcoded (300pt wide)")
                    .font(.caption)
                HardcodedCard()
            }

            VStack {
                Text("GeometryReader (90% of screen)")
                    .font(.caption)
                AdaptiveCard()
            }
        }
        .padding()
    }
}

#Preview {
    BasicsView()
}
