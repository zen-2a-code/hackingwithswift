//
//  CreatingContextMenusView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 23.03.26.
//

import SwiftUI

struct CreatingContextMenusView: View {
    @State private var backgroundColor: Color = .red
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello world")
                .padding()
                .background(backgroundColor)
            
            Text("Change color context menu")
                .contextMenu {
                    Button("Red", systemImage: "car") {
                        backgroundColor = .red
                    }
                    
                    Button("Blue", systemImage: "house") {
                        backgroundColor = .blue
                    }
                    
                    Button("Green", systemImage: "cat") {
                        backgroundColor = .green
                    }
                }
        }
    }
}

#Preview {
    CreatingContextMenusView()
}
