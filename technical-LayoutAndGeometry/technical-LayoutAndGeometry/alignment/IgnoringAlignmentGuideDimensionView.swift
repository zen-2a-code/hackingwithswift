//
//  IgnoringAlignmentGuideDimensionView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 10.04.26.
//

import SwiftUI

struct IgnoringAlignmentGuideDimensionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in Double(position) * -10 }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

#Preview {
    IgnoringAlignmentGuideDimensionView()
}
