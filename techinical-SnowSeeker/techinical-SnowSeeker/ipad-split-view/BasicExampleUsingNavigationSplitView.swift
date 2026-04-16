//
//  UsingNavigationSplitView.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

struct BasicExampleUsingNavigationSplitView: View {
    var body: some View {
        NavigationSplitView {
            Text("Primary")
        } detail: {
            Text("Content")
        }
    }
}


#Preview {
    BasicExampleUsingNavigationSplitView()
}
