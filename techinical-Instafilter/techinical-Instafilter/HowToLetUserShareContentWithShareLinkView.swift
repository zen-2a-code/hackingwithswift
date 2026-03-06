//
//  HowToLetUserShareContentWithShareLinkView.swift
//  techinical-Instafilter
//
//  Created by Stoyan Hristov on 6.03.26.
//

import SwiftUI

struct HowToLetUserShareContentWithShareLinkView: View {
    var body: some View {
        let example = Image(.example)
        
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
        
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
        
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
//            Label("Spread the word about Swift", systemImage: "swift")
//        }
        
        ShareLink(item: example, preview: SharePreview("Utrecht", image: example)) {
            Label("Click to share", systemImage: "house.lodge")
        }
    }
}

#Preview {
    HowToLetUserShareContentWithShareLinkView()
}
