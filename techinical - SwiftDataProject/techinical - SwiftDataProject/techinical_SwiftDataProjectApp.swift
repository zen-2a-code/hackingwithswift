import SwiftData
import SwiftUI

@main
struct techinical_SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: User.self)
        }
    }
}
