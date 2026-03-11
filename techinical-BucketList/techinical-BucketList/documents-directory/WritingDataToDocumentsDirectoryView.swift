//
//  WritingDataToDocumentsDirectoryView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 11.03.26.
//

import SwiftUI

struct WritingDataToDocumentsDirectoryView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Read and Write") {
                let data = Data("Test Message".utf8)
                let url = URL.documentsDirectory.appending(path: "message.txt")

                do {
                    try data.write(to: url, options: [.atomic, .completeFileProtection])
                    let input = try String(contentsOf: url, encoding: .utf8)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    WritingDataToDocumentsDirectoryView()
}
