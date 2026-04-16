
//
//  TransparentLayoutContainerView.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI


private struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct SizeClassesView: View {
    // .compact == vertical .regular == horizontal
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

       var body: some View {
           if horizontalSizeClass == .compact {
               VStack {
                   UserView()
               }
           } else {
               HStack {
                   UserView()
               }
           }
       }
   }

#Preview {
    SizeClassesView()
}
