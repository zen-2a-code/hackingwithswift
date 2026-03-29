//
//  ContentView-ViewModel.swift
//  WhatWasYourNameAgain?-Documents
//
//  Created by Stoyan Hristov on 20.03.26.
//

import CoreLocation
import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        var people: [Person]
        private let documentsPath = URL.documentsDirectory.appending(path: "people")
        
        init() {
            do {
                let data = try Data(contentsOf: documentsPath)
                people = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                people  = []
            }
        }
        
        func save() {
            do {
                let encodedPeopleData = try JSONEncoder().encode(people)
                try encodedPeopleData.write(to: documentsPath)
            } catch {
                print("Unable to save data")
            }
        }
    
        func addPerson(name: String, imageData: Data, currentCoordinates: CLLocationCoordinate2D) {
            self.people.append(Person(name: name, imageData: imageData, latitude: currentCoordinates.latitude,
                                      longitude: currentCoordinates.longitude))
            save()
        }
    }
    
}
