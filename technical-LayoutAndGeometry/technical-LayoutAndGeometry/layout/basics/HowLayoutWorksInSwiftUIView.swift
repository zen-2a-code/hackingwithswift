//
//  HowLayoutWorksInSwiftUIView.swift
//  technical-LayoutAndGeometry
//
//  Created by Stoyan Hristov on 9.04.26.
//

import SwiftUI

// MARK: - Layout Basics Demo
//
// SwiftUI layout follows a simple three-step conversation:
//
//   1. Parent PROPOSES a size to its child.
//   2. Child CHOOSES its own size (parent must respect this).
//        .frame() is a deliberate override. It's the escape hatch SwiftUI gives you to say "I don't care what the child wants, this view is this size."
//   3. Parent POSITIONS the child in its coordinate space.
//
// Modifiers wrap views like nested boxes.
// The LAST modifier in your code is the OUTERMOST box in the view tree.
// Layout flows INWARD (outer → inner),
// size answers bubble OUTWARD (inner → outer).
//
// A view or modifier is LAYOUT NEUTRAL if it:
//   - Accepts whatever size its parent proposes
//   - Passes that same proposal unchanged to its child
//   - Returns the child's size unchanged to its parent
//
// Examples of layout neutral:  Color, Shape, .background(), .overlay()
// Examples of NOT neutral:     .frame() (fixes size), .padding() (shrinks proposal)

struct HowLayoutWorksInSwiftUIView: View {
    var body: some View {

        // MARK: Example 1 — Text with background and padding
        //
        // Reading order in code:
        // Text → padding → background
        // Actual view tree:
        // background( padding( Text ) )   ← outermost last
        //
        // Layout conversation:
        //   SwiftUI     → background : "Here's the whole screen."
        //   background  → padding    : "Here's the whole screen."   (neutral, passes through)
        //   padding     → Text       : "Here's screen minus 20pt each side." (NOT neutral — shrinks proposal)
        //   Text        → padding    : "I need X × Y."
        //   padding     → background : "I need X+40 × Y+40."        (adds padding back)
        //   background  → SwiftUI   : "I need X+40 × Y+40."         (neutral, passes through)
        //   SwiftUI positions background centered on screen.
        //
        // Try swapping .padding() and .background() to see the difference!

        Text("Hello, SwiftUI Layout!")
            .padding(20)        // NOT neutral — subtracts 20pt from the proposal going down,
                                // adds 20pt to the size answer coming back up
            .background(.red)   // NEUTRAL — just wraps whatever size its child reported


        // MARK: Example 2 — Image layout (scroll down in Preview to see)
        //
        // Without .resizable():
        //   Frame proposes 100×100. Image honestly reports back its full resolution e.g. 1200×800.
        //   Frame IGNORES the image's size and reports 100×100 to SwiftUI anyway.
        //   The image renders at full resolution, centered inside the frame, overflowing on all sides.
        //   The stubborn one here is the frame, not the image.
        //
        // With .resizable():
        //   Image becomes FLEXIBLE — it will accept whatever size the frame proposes.
        //   It no longer insists on its natural resolution.
        //   But flexible ≠ neutral. It still has an aspect ratio it wants to protect.
        //
        // With .scaledToFill():
        //   Image NEGOTIATES — "I'll fill your frame completely,
        //   but I'm keeping my proportions. Some of me may spill outside."
        //
        // With .clipped():
        //   Frame puts its foot down — "anything outside my bounds gets cut off."
        //
        // Layout conversation:
        //   SwiftUI   → frame  : "Here's the whole screen."
        //   frame     → image  : "Here's 100×100."              (.frame is NOT neutral)
        //   image              : "Fine, I'll fill 100×100,
        //                         scaled to keep my aspect ratio." (.resizable + scaledToFill)
        //   frame     → SwiftUI: "I need 100×100."
        //   SwiftUI positions frame centered on screen.
        //   .clipped() then cuts off any overflow outside the 100×100 box. - clipped() is purely a rendering instruction, not a layout one.

        Image(.example)
            .resizable()        // Makes image FLEXIBLE — accepts proposed size instead of demanding natural resolution
            .scaledToFill()     // NEGOTIATES aspect ratio — fills frame, may overflow
                                // Use .scaledToFit() instead to stay fully inside (may leave empty space)
            .frame(width: 100, height: 100) // NOT neutral — proposes a fixed size to its child
            .clipped()          // NEUTRAL — clips visual overflow, does not change layout size
            .border(.red, width: 1) // NEUTRAL — draws border at whatever size the view already is
    }
}

#Preview {
    // Wrapping in VStack + ScrollView so both examples are visible in preview
    ScrollView {
        VStack(spacing: 40) {
            HowLayoutWorksInSwiftUIView()
        }
        .padding()
    }
}
