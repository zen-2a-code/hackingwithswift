//
//  ContentView.swift
//  BucketList
//
//  Created by Stoyan Hristov on 14.03.26.
//

import MapKit
import SwiftUI

struct ContentView: View {
    private var startPosition = MapCameraPosition.region(
        MKCoordinateRegion( center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
                            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    @State private var locations = Array<Location>()
    @State private var selectedLocation: Location?
    
    var body: some View {
        MapReader { mapProxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) {location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .frame(width: 44, height: 44)
                            .foregroundStyle(.red)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                selectedLocation = location
                            }
                    }
                }
            }
            .sheet(item: $selectedLocation) {unwrappedSelectedLocation in
                EditView(location: unwrappedSelectedLocation) { newLocaton in
                    if let index = locations.firstIndex(of: unwrappedSelectedLocation) {
                        locations[index] = newLocaton
                    }
                    
                }
            }
            .onTapGesture { mapScreenLocalPosition in
                if let coordinate = mapProxy.convert(mapScreenLocalPosition, from: .local) {
                    let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locations.append(newLocation)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
