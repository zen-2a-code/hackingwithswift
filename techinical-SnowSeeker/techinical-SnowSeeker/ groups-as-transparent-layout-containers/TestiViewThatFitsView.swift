//
//  TestiViewThatFitsView.swift
//  techinical-SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

struct TestiViewThatFitsView: View {
    var body: some View {
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)

            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    TestiViewThatFitsView()
}
