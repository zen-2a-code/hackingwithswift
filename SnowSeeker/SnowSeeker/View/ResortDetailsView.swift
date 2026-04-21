//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Stoyan Hristov on 21.04.26.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort

    var size: String {
        switch resort.size {
        case 1: "small"
        case 2: "Average"
        default: "Large"
        }
    }

    var price: String {
        String(repeating: "$", count: resort.price)
    }
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                Text(size)
                    .font(.title3)
            }

            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
