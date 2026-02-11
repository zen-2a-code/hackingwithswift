//
//  ContentView.swift
//  Bookworm-technical-CoreData
//
//  Created by Stoyan Hristov on 11.02.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            List(students) { currentStudent in
                Text(currentStudent.name)
            }
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!

                    let newStudent = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")

                    modelContext.insert(newStudent)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
