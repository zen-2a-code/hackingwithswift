//
//  RelativeFrameVsGeoReader.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 11.04.26.
//

import SwiftUI

struct RelativeFrameVsGeoReader: View {
    var body: some View {
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)

            Image(.example)
                .resizable()
                .scaledToFit()
            // relative frame is reading the size based on the perent container (view), but doesn't count VStack HStack as containers.
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
        }
        Spacer()
        
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)

            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    // by default geoReaders takes the full width and height and aligns to topLeading corner.
                    .frame(width: proxy.size.width * 0.8)
                    // adding additional frame fixes this because we use the whole size of the geo and the default alignement of frame is .center
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    RelativeFrameVsGeoReader()
}
