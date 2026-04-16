//
//  LinkingViews.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

struct LinkingViews: View {
    var body: some View {
        NavigationSplitView {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
        }
    }
}

#Preview {
    LinkingViews()
}
