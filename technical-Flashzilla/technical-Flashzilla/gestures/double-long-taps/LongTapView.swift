//
//  LongTabView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 1.04.26.
//

import SwiftUI

struct LongTapView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .onLongPressGesture {
//                print("This text is longed tapped!")
//            }
            .onLongPressGesture(minimumDuration: 3) {
                print("This text is longed tapped!")
            }
    }
}

#Preview {
    LongTapView()
}
