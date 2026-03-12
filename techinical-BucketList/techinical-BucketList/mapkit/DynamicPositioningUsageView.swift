//
//  BasicUsageView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 12.03.26.
//

import MapKit
import SwiftUI

struct DynamicPositioningUsageView: View {
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    var body: some View {
        VStack {
            Map(position: $position)
                .mapStyle(.hybrid(elevation: .realistic))
            
            HStack(spacing: 20) {
                Button("Paris") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }

                Button("Tokyo") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
                
                Button("London") {
                    position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
                    )
                }
                
                Button("Sofia") {
                    position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.6975, longitude: 23.3242), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                    )
                }
                
                Button("Utrecht") {
                    position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.0907, longitude: 5.1214), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                    )
                }
            }
        }
    }
}

#Preview {
    DynamicPositioningUsageView()
}
