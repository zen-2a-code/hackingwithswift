//
//  HowToBeNotifiedWhenSwiftUIAppMovesToBackgroundView.swift
//  technical-Flashzilla
//
//  Created by Stoyan Hristov on 2.04.26.
//

import SwiftUI

struct HowToBeNotifiedWhenSwiftUIAppMovesToBackgroundView: View {
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Text("Hello, world!")
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    HowToBeNotifiedWhenSwiftUIAppMovesToBackgroundView()
}
