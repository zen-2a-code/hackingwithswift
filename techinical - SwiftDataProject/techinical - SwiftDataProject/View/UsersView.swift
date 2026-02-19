//
//  UsersView.swift
//  techinical - SwiftDataProject
//
//  Created by Stoyan Hristov on 19.02.26.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)

                Spacer()

                Text(String(user.unwrappedJobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear {
            try? modelContext.delete(model: User.self)
            addSample()
        }
    }

    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }

    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)

        modelContext.insert(user1)

        user1.jobs?.append(job1)
        user1.jobs?.append(job2)
    }
}

#Preview() {
    UsersView(minimumJoinDate: Date.now, sortOrder: [SortDescriptor<User>(\User.name),
                                                     SortDescriptor(\User.joinDate)])
        .modelContainer(for: User.self)
}
