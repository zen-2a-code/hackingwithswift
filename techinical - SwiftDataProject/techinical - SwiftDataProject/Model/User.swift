//
//  User.swift
//  techinical - SwiftDataProject
//
//  Created by Stoyan Hristov on 19.02.26.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    // this is better approach, but for the lecture i will use the one afte this
//    @Relationship(deleteRule: .cascade) var jobs: [Job] = []
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    var unwrappedJobs: [Job] {
        self.jobs ?? []
    }
    
    init(name: String, city: String, joinDate: Date, jobs: [Job]? = nil) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
        self.jobs = jobs
    }
}
