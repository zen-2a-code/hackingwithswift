//
//  FlashzillaApp.swift
//  Flashzilla
//
//  Created by Stoyan Hristov on 4.04.26.
//

import SwiftData
import SwiftUI

@main
struct FlashzillaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Card.self)
        }
    }
}
