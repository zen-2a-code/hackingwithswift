//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Stoyan Hristov on 12.02.26.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
