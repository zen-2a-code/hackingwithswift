//
//  EditProspectDetailsView.swift
//  HotProspects
//
//  Created by Stoyan Hristov on 29.03.26.
//

import SwiftUI

struct EditProspectDetailsView: View {
    @Bindable var prospect: Prospect
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Please enter prospect name:", text: $prospect.name)
            TextField("Please enter prospect email:", text: $prospect.emailAddress)
            Toggle(isOn: $prospect.isContacted) {
                Text("Is this prospect contacted?")
            }
        }
        .navigationTitle("Edit Prospect")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save", systemImage: "checkmark", role: .confirm) {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditProspectDetailsView(prospect: Prospect(name: "Stoyan", emailAddress: "test@test.com", isContacted: false))
    }
}
