//
//  AddingConformanceToComparableForCustomTypesView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 10.03.26.
//

import SwiftUI

struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    //  'lhs' = left-hand side value
    // 'rhs' = right-hand side value
    
    // This overloads the '<' comparison operator for the `User` type,
    // telling Swift how two User objects should be ordered when sorting.
    static func<(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct AddingConformanceToComparableForCustomTypesView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    var body: some View {
        List(users) {
            Text("\($0.lastName), \($0.firstName)")
        }
    }
}

#Preview {
    AddingConformanceToComparableForCustomTypesView()
}
