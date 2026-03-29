//
//  SelectingSingleFileView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 22.03.26.
//

import SwiftUI

struct SelectingMultipleItemsView: View {
    let users = ["Stoyan", "Siyana", "Pizza", "Miroslav", "Boryo", "Deya"]
    @State private var selectedItems = Set<String>()
    var body: some View {
        List(users, id: \.self, selection: $selectedItems) {user in
            Text(user)
        }
        
        EditButton()
        if !selectedItems.isEmpty {
            Text("Current selected user: \(selectedItems.formatted())")
        }
    }
}

#Preview {
    SelectingMultipleItemsView()
}
