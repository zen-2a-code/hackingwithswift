//
//  FriendsBookApp.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import SwiftData
import SwiftUI

@main
struct FriendsBookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: User.self)
        }
    }
}
