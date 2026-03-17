//
//  ContentView.swift
//  BucketList
//
//  Created by Stoyan Hristov on 14.03.26.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var selectedMapStyle: MapStyles = .standard
    
    private var mapKitStyle: MapStyle {
        switch selectedMapStyle {
        case .standard:
            .standard
        case .hybrid:
            .hybrid
        }
    }
    
    private var startPosition = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
                           span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    )
    
    enum MapStyles {
        case standard, hybrid
    }

    var body: some View {
        if viewModel.isUnlocked {
            MapReader { mapProxy in
                ZStack(alignment: .bottomTrailing) {
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .frame(width: 44, height: 44)
                                    .foregroundStyle(.red)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onTapGesture {
                                        viewModel.selectedLocation = location
                                    }
                            }
                        }
                    }
                    .mapStyle(mapKitStyle)
                    
                    Button {
                        switchMapStyle()
                    } label: {
                        Image(systemName: selectedMapStyle == .standard ? "globe.europe.africa" : "map")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(.secondary.opacity(0.8))
                            .clipShape(.circle)
                            .padding()
                    }
                    .buttonStyle(.plain)
                 }
                .sheet(item: $viewModel.selectedLocation) { unwrappedSelectedLocation in
                    EditView(location: unwrappedSelectedLocation) { newLocaton in
                        viewModel.update(updatedLocation: newLocaton)
                    }
                }
                .onTapGesture { mapScreenLocalPosition in
                    if let coordinate = mapProxy.convert(mapScreenLocalPosition, from: .local) {
                        viewModel.addLocation(at: coordinate)
                    }
                }
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                .alert(viewModel.alertTitle, isPresented: $viewModel.shouldShowAlert) {
                    Button("OK") {}
                } message: {
                    Text(viewModel.alertMessage)
                }
        }
    }
    
    func switchMapStyle() {
        switch selectedMapStyle {
        case .standard:
            selectedMapStyle = .hybrid
        case .hybrid:
            selectedMapStyle = .standard
        }
    }
}

#Preview {
    ContentView()
}
