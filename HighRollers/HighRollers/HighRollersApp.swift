//
//  HighRollersApp.swift
//  HighRollers
//
//  Created by Stoyan Hristov on 13.04.26.
//

import SwiftData
import SwiftUI

@main
struct HighRollersApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView(modelContext: container.mainContext)
                .modelContainer(container)
        }
    }
    init() {
        do {
            container = try ModelContainer(for: Roll.self)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
