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

struct TransparentLayoutContainerView: View {
    @State private var layoutVertically = false

      var body: some View {
          Button {
              layoutVertically.toggle()
          } label: {
              if layoutVertically {
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
  }

#Preview {
    TransparentLayoutContainerView()
}
