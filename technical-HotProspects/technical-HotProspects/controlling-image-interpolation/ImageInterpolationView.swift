//
//  ImageInterpolationView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 23.03.26.
//

import SwiftUI

struct ImageInterpolationView: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolationView()
}
