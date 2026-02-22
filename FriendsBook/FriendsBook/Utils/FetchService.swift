//
//  FetchService.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import Foundation

struct FetchService {
    func fetchUsers() async -> [User] {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var users: [User] = []
        
        do {
            let (data, _) =  try await URLSession.shared.data(from: url)
            
            if let decodedData = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedData
            }
        } catch {
            print("Unable to fetch data")
        }
        
        return users
        }
    
    }
