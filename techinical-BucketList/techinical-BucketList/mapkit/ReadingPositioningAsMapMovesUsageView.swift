//
//  BasicUsageView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 12.03.26.
//

import MapKit
import SwiftUI

struct ReadingPositioningAsMapMovesUsageView: View {
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    var body: some View {
        VStack {
            Map(position: $position)
                .mapStyle(.hybrid(elevation: .realistic))
                .onMapCameraChange { context in
                    print(context.region)
                }
//                .onMapCameraChange(frequency: .continuous) { context in
//                    print(context.region)
//                }
        }
    }
}

#Preview {
    ReadingPositioningAsMapMovesUsageView()
}
