//
//  BasicUsageView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 12.03.26.
//

import MapKit
import SwiftUI

struct PositioningUsageView: View {
    let position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    var body: some View {
        Map(initialPosition: position)
            .mapStyle(.standard)
    }
}

#Preview {
    PositioningUsageView()
}
