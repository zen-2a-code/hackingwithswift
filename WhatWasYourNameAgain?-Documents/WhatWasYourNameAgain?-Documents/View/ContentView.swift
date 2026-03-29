//
//  ContentView.swift
//  WhatWasYourNameAgain?-Documents
//
//  Created by Stoyan Hristov on 20.03.26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var showAddPersonSheet = false
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.people.isEmpty {
                    ContentUnavailableView("List empty\nAdd person", systemImage: "person.crop.circle.badge.plus")
                        .onTapGesture {
                            showAddPersonSheet = true
                        }
                } else {
                    List(viewModel.people.sorted()) {person in
                        PersonRowView(person: person)
                    }
                }
            }
            .navigationTitle("What was your name again?")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showAddPersonSheet) {
                NavigationStack {
                    AddPersonView(onSave: viewModel.addPerson)
                }
            }
            .toolbar {
                Button("Add", systemImage: "plus"){
                    showAddPersonSheet = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
