//
//  QuickTestView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 24.03.26.
//

import SwiftUI

struct QuickTestView: View {
    let result: Result<String, Error>?
    var body: some View {
        switch result {
        case .success(let success):
            Text("Success: \(success)")
        case .failure(let failure):
            Text("There was an error \(failure.localizedDescription)")
        case nil:
            Text("Oh, something went wrong, no fetch at all")
        }
    }
}

#Preview {
    QuickTestView(result: Result<String, any Error>?(nilLiteral: ()))
}
