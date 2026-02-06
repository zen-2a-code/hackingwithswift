//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Stoyan Hristov on 6.02.26.
//

import SwiftUI

struct LoadingImageFromServer: View {
    var body: some View {
        // this is the default way to load an image, if we load an image this way, we lose the ability to resize it, other than scale 1,2,3. We cannot apply frame or reseize.

//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)

        // another way to load an image is actually use the closure and provide the image, this way we have power over the placeholder image and we can reseize it using frame
        // it is good to mention that if we don't have a placeholder, the image is actually wrapped inside of a phase

//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        }
//        placeholder: {
//            Text("Loading...")
//        }
//        .frame(height: 200)

        // the last way is to actually use phase which give access to error when loading

        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(height: 200)
    }
}

#Preview {
    LoadingImageFromServer()
}
