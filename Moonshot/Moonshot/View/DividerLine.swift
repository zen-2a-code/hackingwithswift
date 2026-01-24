//
//  DividerLine.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 24.01.26.
//

import SwiftUI

struct DividerLine: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerLine()
}
