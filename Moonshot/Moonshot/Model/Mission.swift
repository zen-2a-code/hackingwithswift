//
//  Missions.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 23.01.26.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formatedLunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
