//
//  ConflictTapView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

struct ConflictGestureView: View {
    var body: some View {
        // SwiftUI will always give the child’s gesture priority
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .onTapGesture {
            print("VStack tapped")
        }
    }
}

#Preview {
    ConflictGestureView()
}
