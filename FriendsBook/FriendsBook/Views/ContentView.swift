//
//  ContentView.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    var body: some View {
        VStack {
            NavigationStack {
                UsersView(users: $users)
                    .navigationTitle("Users")
            }
        }
        .task {
            let fetchService = FetchService()
            users = await fetchService.fetchUsers()
            
            print(users)
        }
    }
}

#Preview {
    ContentView()
}
