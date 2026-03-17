//
//  BasicUsageView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 12.03.26.
//

import MapKit
import SwiftUI

struct BasicUsageView: View {
    var body: some View {
        Map()
            .mapStyle(.standard)
//            .mapStyle(.imagery)
            .mapStyle(.hybrid)
//            .mapStyle(.hybrid(elevation: .realistic))
//            .mapStyle(.hybrid(elevation: .realistic,showsTraffic: true))
        
            // we can only zoom or rotate from current possion
//        Map(interactionModes: [.rotate, .zoom])
    }
}

#Preview {
    BasicUsageView()
}
