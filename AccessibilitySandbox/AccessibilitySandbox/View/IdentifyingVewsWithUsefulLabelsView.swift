//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Stoyan Hristov on 18.03.26.
//

import SwiftUI

struct IdentifyingVewsWithUsefulLabelsView: View {
    @State private var selectedImageIndex = Int.random(in: 0...3)
    
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let accessibilityLabels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]

    
    var body: some View {
        // The accessibility problem - it just speaks the image name (which is quite confusing) and says image instead of button
//       Image(pictures[selectedImageIndex])
//            .resizable()
//            .scaledToFit()
//            .onTapGesture {
//                selectedImageIndex = Int.random(in: 0...3)
//            }
        
        
        /*
         Better option, now it doesn't speak random image names, and says that the image is actually a button but we have design issues.
         */
        
//        Image(pictures[selectedImageIndex])
//             .resizable()
//             .scaledToFit()
//             .onTapGesture {
//                 selectedImageIndex = Int.random(in: 0...3)
//             }
//             .accessibilityLabel(accessibilityLabels[selectedImageIndex])
//             .accessibilityAddTraits(.isButton)
//             .accessibilityRemoveTraits(.isImage)
        
        
        // best semantic option
        Button {
            selectedImageIndex = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedImageIndex])
                 .resizable()
                 .scaledToFit()
                 .accessibilityLabel(accessibilityLabels[selectedImageIndex])
        }
    }
}

/*    .accessibilityLabel() and .accessibilityHint(). They both take text containing anything we want, but they serve different purposes:

    The label is read immediately, and should be a short piece of text that gets right to the point. If this view deletes an item from the user’s data, it might say “Delete”.
    The hint is read after a short delay, and should provide more details on what the view is there for. It might say “Deletes an email from your inbox”, for example.
 

 .accessibilityAddTraits(.isButton) - add traits for voiceOver
 .accessibilityRemoveTraits(.isImage) removes traits for voiceOver
 
 */

#Preview {
    IdentifyingVewsWithUsefulLabelsView()
}
