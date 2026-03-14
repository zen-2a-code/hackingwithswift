//
//  BasicUsageView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 12.03.26.
//

import MapKit
import SwiftUI

struct ReadingTapLocationView: View {
    let position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: position)
                .onTapGesture { localMapScreenPosition in
                    if let coordinate = proxy.convert(localMapScreenPosition, from: .local) {
                        print(coordinate)
                    }
                }
        }
    }
}

#Preview {
    ReadingTapLocationView()
}
