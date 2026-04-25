//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Stoyan Hristov on 22.04.26.
//

import Foundation

@Observable
class Favorites {
    // the actual resorts the user has favorited
    private var resorts: Set<String>

    // the key we're using to read/write in UserDefaults
    private let key = "Favorites"
    

    init() {
        // load our saved data
        if let resortsArray = UserDefaults.standard.array(forKey: key) as? [String] {
            resorts = Set(resortsArray)
        } else {
            // still here? Use an empty array
            resorts = []
        }
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set and saves the change
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set and saves the change
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }

    func save() {
        let resortsAsArray = Array(resorts)
        UserDefaults.standard.set(resortsAsArray, forKey: key)
        // write out our data
    }
}
