//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Stoyan Hristov on 15.03.26.
//

import CoreLocation
import LocalAuthentication
import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedLocation: Location?
        private let savedPath = URL.documentsDirectory.appending(path: "SavedPlaces")
        var isUnlocked = false
        
        init() {
            do {
                let data = try Data(contentsOf: savedPath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savedPath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(updatedLocation: Location) {
            guard let selectedLocation else { return }
            
            if let index = locations.firstIndex(of: selectedLocation) {
                locations[index] = updatedLocation
                save()
            }
        }
        
        func authenticate () {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {success, authenticationError in
                    
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                    }
                }
                
            } else {
                // no biometric
            }
        }
    }
}
