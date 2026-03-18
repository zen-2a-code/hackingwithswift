//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Stoyan Hristov on 18.03.26.
//

import SwiftUI

struct HidingAndGroupingAccessibilityDataView: View {
    var body: some View {
        VStack {
            // this reads out the name of the image + that is image
//            Image(.character)
            
            // this doesn't read the image, this is used when the image is of no imporantance for the user.
//            Image(.character)
//                .accessibilityHidden(true)
            
//            this is read as seperate entities, and it is hard for the user to grasp that they are linked together
//            VStack {
//                Text("Your score is")
//                Text("1000")
//                    .font(.title)
//            }
            
            
// A better alternative is to use grouping on the parent view, this reads them together. This works best for seperate but related data
//                Text("Your score is")
//                Text("1000")
//                    .font(.title)
//            }
//            .accessibilityElement(children: .combine)
            
            // even better approach is to disable the reader for the whole view, and then add a custom lable when the data is closely related
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        }
    }


#Preview {
    HidingAndGroupingAccessibilityDataView()
}
