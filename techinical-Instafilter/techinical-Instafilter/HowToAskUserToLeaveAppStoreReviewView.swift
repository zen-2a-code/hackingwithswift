//
//  HowToAskUserToLeaveAppStoreReviewView.swift
//  techinical-Instafilter
//
//  Created by Stoyan Hristov on 6.03.26.
//

import StoreKit
import SwiftUI

struct HowToAskUserToLeaveAppStoreReviewView: View {
    @Environment(\.requestReview) private var requestReview
    var body: some View {
        Button("Review App") {
            // This is NOT a good practice, we should rather use counter and show the review prompt when the user have completed a couple of main actions in our app. It is good to notice that the review prompt won't be displaed if the user has already review the app, or has disable app review prompts in the Settings
            requestReview()
        }
    }
}

#Preview {
    HowToAskUserToLeaveAppStoreReviewView()
}
