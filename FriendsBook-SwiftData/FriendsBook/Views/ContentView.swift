//
//  ContentView.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var users: [User]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            NavigationStack {
                UsersView(users: users)
                    .navigationTitle("Users")
            }
        }
        .task {
            
            if users.isEmpty {
                let fetchService = FetchService()
                let fetchedUsers = await fetchService.fetchUsers()
                
                for user in fetchedUsers {
                    modelContext.insert(user)
                }
                
                print("Loaded from server")
                return
            }
            
            print("Loaded locally")
        }
    }
}

#Preview {
    ContentView()
}
