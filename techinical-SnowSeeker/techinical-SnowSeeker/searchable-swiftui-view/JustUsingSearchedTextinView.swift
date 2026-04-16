//
//  JustUsingSearchedTextinView.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

struct JustUsingSearchedTextinView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Searching")
        }
    }
}

#Preview {
    JustUsingSearchedTextinView()
}
