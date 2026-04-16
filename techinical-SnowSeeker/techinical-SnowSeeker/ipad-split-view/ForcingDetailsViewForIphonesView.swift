//
//  ForcingDetailsViewForIphonesView.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

struct ForcingDetailsViewForIphonesView: View {
    var body: some View {
        NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ForcingDetailsViewForIphonesView()
}
