//
//  AddNewHabbitView.swift
//  Habbit Tracker
//
//  Created by Stoyan Hristov on 3.02.26.
//

import SwiftUI

struct AddNewHabbitView: View {
    var habbits: Habbits
    @State private var title: String = ""
    @State private var description: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var isTitleValid: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).count >= 3
    }
    var body: some View {
        Form {
            TextField("Enter Title (min 3 characters)", text: $title)
            if !isTitleValid && !title.isEmpty {
                Text("Title must be at least 3 characters")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
            TextField("Enter Description (Optional)", text: $description)
        }
        .presentationDragIndicator(.visible)
        .navigationTitle("Add new Habbit")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel", systemImage: "xmark", role: .destructive) {
                    dismiss()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Save", role: .confirm) {
                    let newHabbit = Habbit(title: title, description: description == "" ? nil : description)
                    habbits.habbits.insert(newHabbit, at: 0)
                    dismiss()
                }
                .disabled(!isTitleValid)
            }
        }
    }
}

#Preview {
    let habbits = Habbits()
    NavigationStack {
        AddNewHabbitView(habbits: habbits)
    }
}
