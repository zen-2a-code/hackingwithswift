//
//  GeometryReaderView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 11.04.26.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        VStack {
            GeometryReader { proxy in
                Text("Hello, World!")
                    .frame(width: proxy.size.width * 0.9, height: 40)
                    .background(.red)
            }

            Text("More text")
                .background(.blue)
        }
    }
}

#Preview {
    GeometryReaderView()
}
