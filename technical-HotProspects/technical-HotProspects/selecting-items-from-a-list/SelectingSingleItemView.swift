//
//  SelectingSingleFileView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 22.03.26.
//

import SwiftUI

struct SelectingSingleItemView: View {
    let users = ["Stoyan", "Siyana", "Pizza", "Miroslav", "Boryo", "Deya"]
    @State private var selectedItem: String?
    var body: some View {
        List(users, id: \.self, selection: $selectedItem) {user in
            Text(user)
        }
        if let selectedItem {
            Text("Current selected user: \(selectedItem)")
        }
        
    }
}

#Preview {
    SelectingSingleItemView()
}
