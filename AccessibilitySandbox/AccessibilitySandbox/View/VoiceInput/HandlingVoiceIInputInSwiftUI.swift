//
//  HandlingVoiceIInputInSwiftUI.swift
//  AccessibilitySandbox
//
//  Created by Stoyan Hristov on 19.03.26.
//


import SwiftUI

struct HandlingVoiceIInputInSwiftUI: View {
    var body: some View{
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}


#Preview {
    HandlingVoiceIInputInSwiftUI()
}
