//
//  UsingTouchIDandFaceIDWithSwiftUIView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 12.03.26.
//

import LocalAuthentication
import SwiftUI

// Before we write any code, you need to add a new key to your project options
// Select your current target, go to the Info tab, right-click on an existing key, then choose Add Row. Scroll through the list of keys until you find “Privacy - Face ID Usage Description” and give it the value “We need to unlock your data.”

struct UsingTouchIDandFaceIDWithSwiftUIView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    UsingTouchIDandFaceIDWithSwiftUIView()
}
