//
//  RespondingTostateChangesUsingOnChangeView.swift
//  techinical-Instafilter
//
//  Created by Stoyan Hristov on 25.02.26.
//

import SwiftUI

struct RespondingTostateChangesUsingOnChangeView: View {
    @State private var blurAmount = 0.0 {
            didSet {
                print("New value is \(blurAmount)")
            }
        }

        var body: some View {
            VStack {
                Text("Hello, World!")
                    .blur(radius: blurAmount)

                Slider(value: $blurAmount, in: 0...20)
                    .onChange(of: blurAmount) { oldValue, newValue in
                         print("New value is \(newValue)")
                     }
            }
        }
}

#Preview {
    RespondingTostateChangesUsingOnChangeView()
}
