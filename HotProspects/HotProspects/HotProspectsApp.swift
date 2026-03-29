//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Stoyan Hristov on 25.03.26.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
