//
//  UsersView.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import SwiftUI

struct UsersView: View {
    @Binding var users: [User]
    var body: some View {
        List(users) {user in
            NavigationLink(value: user) {
                HStack {
                    Image(systemName: user.isActive ? "person" : "personalhotspot.slash")
                        .padding()
                        .frame(minWidth: 60)
                        .background(user.isActive ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                        .clipShape(.capsule)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(user.name)
                        Text("Age: \(user.age)")
                    }
                }
            }
        }
        .navigationDestination(for: User.self) { user in
            UserDetails(user: user)
//                .padding(.horizontal, 20)
        }
    }
}

#Preview {
    @Previewable @State var users: [User] = BundleJSONLoader.load("sample.json", as: [User].self)
    
    NavigationStack {
        UsersView(users: $users)
    }
}
