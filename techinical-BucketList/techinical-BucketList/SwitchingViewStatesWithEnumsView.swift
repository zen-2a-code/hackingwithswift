//
//  SwitchingViewStatesWithEnumsView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 11.03.26.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed

    static func random() -> Self {
        switch Int.random(in: 0 ..< 3) {
        case 0: return .loading
        case 1: return .success
        case 2: return .failed
        default: fatalError()
        }
    }
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct SwitchingViewStatesWithEnumsView: View {
    @State private var loadingState = LoadingState.random()
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

#Preview {
    SwitchingViewStatesWithEnumsView()
}
