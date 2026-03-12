//
//  BasicUsageView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 12.03.26.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct PlacingAnotationsOnMap: View {
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    var body: some View {
        Map {
            ForEach(locations) { location in
//                Marker(location.name, coordinate: location.coordinate)
                
                Annotation(location.name, coordinate: location.coordinate) {
                    Text(location.name)
                        .font(.headline)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
                .annotationTitles(.hidden)
            }
        }
    }
}

#Preview {
    PlacingAnotationsOnMap()
}
