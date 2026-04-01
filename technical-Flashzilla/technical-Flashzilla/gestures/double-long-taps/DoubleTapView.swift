//
//  DoubleTapView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

struct DoubleTapView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture(count: 2) {
                print("This text is double tapped!")
            }
    }
}

#Preview {
    DoubleTapView()
}
