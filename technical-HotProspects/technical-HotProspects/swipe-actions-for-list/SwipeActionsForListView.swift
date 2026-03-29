//
//  SwipeActionsForListView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 24.03.26.
//

import SwiftUI

// buttons with the role destructive appears to animate UI removal, but of course this is only for UI, not real data.

struct SwipeActionsForListView: View {
    @State private var amazing = ["Siyana", "The new Tesla model 3/Y", "My will for success", "IOS Development"]
    var body: some View {
        List(amazing, id: \.self) { item in
            Text(item)
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Here we can call the pin function for item \(item)")
                    }
                    .tint(.orange)
                }
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Here we can call delete function for item \(item)")
                        print(String(amazing.count))
                    }
                }
        }
    }
}

#Preview {
    SwipeActionsForListView()
}
