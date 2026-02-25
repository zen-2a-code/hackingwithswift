//
//  HowPropertyWrappersBecomeStructsView.swift
//  techinical-Instafilter
//
//  Created by Stoyan Hristov on 25.02.26.
//

import SwiftUI

struct HowPropertyWrappersBecomeStructsView: View {
    // We can open “Open Quickly” (using Cmd+Shift+O)
    // if we type state and open the first match, this will take us to the so called generated interface which is essentially all the parts that SwiftUI exposes to us. There’s no implementation code in there, just lots of definitions for protocols, structs, modifiers, and such.
    @State private var blur = 0.0 {
        didSet{
            print("New blur value: \(blur)")
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .blur(radius: blur)
        
        Slider(value: $blur, in: 0...20)
        
        
        Button("Random blur") {
            blur = .random(in: 0...20)
        }
    }
}

#Preview {
    HowPropertyWrappersBecomeStructsView()
}
