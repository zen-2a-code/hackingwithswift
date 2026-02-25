//
//  ShowingMultipleOptionsWithConfirmationDialogView.swift
//  techinical-Instafilter
//
//  Created by Stoyan Hristov on 25.02.26.
//

import SwiftUI

struct ShowingMultipleOptionsWithConfirmationDialogView: View {
    @State private var showingConfirmation = false
      @State private var backgroundColor = Color.white

      var body: some View {
          Button("Hello, World!") {
              showingConfirmation = true
          }
          .frame(width: 300, height: 300)
          .background(backgroundColor)
          .confirmationDialog("Change background", isPresented: $showingConfirmation) {
              Button("Red") { backgroundColor = .red }
              Button("Green") { backgroundColor = .green }
              Button("Blue") { backgroundColor = .blue }
              Button("Cancel", role: .cancel) { }
          } message: {
              Text("Select a new color")
          }
      }
  }
#Preview {
    ShowingMultipleOptionsWithConfirmationDialogView()
}
