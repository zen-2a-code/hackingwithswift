//
//  AligmentAndFrameView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 10.04.26.
//

import SwiftUI

struct AligmentAndFrameView: View {
    var body: some View {
        Text("Live long and prosper")
            .border(.red, width: 2)
            .padding(10)
            .frame(width: 300, height: 300, alignment: .topLeading)
            .border(.green, width: 2)
    }
}

#Preview {
    AligmentAndFrameView()
}
