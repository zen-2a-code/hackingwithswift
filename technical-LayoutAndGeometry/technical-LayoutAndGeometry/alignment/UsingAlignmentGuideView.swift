//
//  UsingAlignmentGuideView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 10.04.26.
//

import SwiftUI

struct UsingAlignmentGuideView: View {
    var body: some View {
         VStack(alignment: .leading) {
             Text("Hello, world!")
                 .alignmentGuide(.leading) { dimension in
                     dimension[.trailing]
                 }
             Text("This is a longer line of text")
         }
         .background(.red)
         .frame(width: 400, height: 400)
         .background(.blue)
     }
}

#Preview {
    UsingAlignmentGuideView()
}
