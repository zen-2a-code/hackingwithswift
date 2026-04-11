//
//  StackAlignmentView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 10.04.26.
//

import SwiftUI

struct StackAlignmentView: View {
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper")
                .font(.largeTitle)
        }
        .border(.green, width: 1)
    }
}

#Preview {
    StackAlignmentView()
}
