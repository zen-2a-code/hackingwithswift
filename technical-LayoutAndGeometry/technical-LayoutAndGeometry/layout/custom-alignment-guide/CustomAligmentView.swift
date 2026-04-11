//
//  CustomAligmentView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 10.04.26.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAligmentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image(.example)
                    .resizable()
                    .frame(width: 64, height: 64)
            }.border(.blue, width: 2)

            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
            .border(.green, width: 2)
        }
        .border(.yellow, width: 3)
    }
}

#Preview {
    CustomAligmentView()
}
