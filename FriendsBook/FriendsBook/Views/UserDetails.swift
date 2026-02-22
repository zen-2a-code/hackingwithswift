//
//  UserDetails.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import SwiftUI

struct UserDetails: View {
    var user: User
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack(spacing: 10) {
                    Text("Age: \(user.age)")
                        .font(Font.caption.bold())
                        .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text("Company: \(user.company)")
                        .font(.subheadline.italic())
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                HStack {
                    Text("Address: \(user.address)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                HStack {
                    Text("Email: \(user.email)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            
            .padding(.horizontal, 5)
            
            Divider()
            
            VStack {
                Text("About")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .padding(.top, 10)
                    .padding(.horizontal, 3)
                    .padding(.bottom, 2)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Text(user.about)
            
            VStack {
                Text("Friends:")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .padding(.top, 10)
                    .padding(.horizontal, 3)
                    .padding(.bottom, 2)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            ScrollView(.horizontal) {
                Text(user.friends.map(\.name).joined(separator: ", "))
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.horizontal, 10)
        .navigationTitle(user.name)
    }
}

#Preview {
    @Previewable @State var users: [User] = BundleJSONLoader.load("sample.json", as: [User].self)
    
    NavigationStack {
        UserDetails(user: users.first!)
    }
}
