//
//  Person.swift
//  WhatWasYourNameAgain?-Documents
//
//  Created by Stoyan Hristov on 20.03.26.
//

import Foundation

struct Person: Codable, Identifiable, Comparable {
    var id = UUID()
    var name: String
    var imageData: Data
    var latitude: Double?
    var longitude: Double?
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
    #if DEBUG
    static var example: Person {
        // when it comes to assets they are special categories, we should not use bundle for assets.
        // why? - Asset catalog images are compiled into Apple’s asset system, not kept as plain files.
        // bundle is only for JSON, PDF, xlsx..etc .. but we should not use SwiftUI, UIKit in the model. so this is the best aproach
        
        
        guard let url = Bundle.main.url(forResource: "example-image", withExtension: "jpg"),
              let data = try? Data(contentsOf: url) else {
            return Person(name: "Stoyan NoPicture", imageData: Data())
        }
        return Person(name: "Stoyan Hristov", imageData: data)
    }
    #endif
}

 
