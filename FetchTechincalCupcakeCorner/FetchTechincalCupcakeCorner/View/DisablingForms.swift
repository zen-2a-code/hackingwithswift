//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Stoyan Hristov on 6.02.26.
//

import SwiftUI

struct DisablingForms: View {
    @State private var username = ""
    @State private var email = ""
    
    private var shouldDisableButton: Bool {
        let regex = try! Regex("^[A-Za-z]{2,}@[A-Za-z0-9-]+\\.[A-Za-z]{2,}$")
        
        return (email.wholeMatch(of: regex) == nil || username.count < 3)
    }
    
    var body: some View {
        Form {
            TextField("Enter username (min 3 chars)", text: $username)
            TextField("Enter email (name@domain.some)", text: $email)
            
            Section {
                Button("Submit", role: .confirm) {
                    print("Hello \(username) with email: \(email)")
                }
            }
            .disabled(shouldDisableButton)
        }
    }
    
}

#Preview {
    DisablingForms()
}
