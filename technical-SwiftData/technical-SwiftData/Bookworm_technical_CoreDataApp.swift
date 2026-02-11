//
//  Bookworm_technical_CoreDataApp.swift
//  Bookworm-technical-CoreData
//
//  Created by Stoyan Hristov on 11.02.26.
//

import SwiftUI
import SwiftData

@main
struct Bookworm_technical_CoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
