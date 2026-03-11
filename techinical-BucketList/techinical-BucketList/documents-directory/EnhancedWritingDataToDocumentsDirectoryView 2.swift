//
//  WritingDataToDocumentsDirectoryView.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 11.03.26.
//

import SwiftUI

struct EnhancedWritingDataToDocumentsDirectoryView: View {
    @State private var userInput = ""
    @State private var readFromDocuments: String?
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            TextField("Enter text", text: $userInput)
                .foregroundColor(Color.primary)
                .frame(width: 300, alignment: .center)
                .padding(10)
                .background(Color.blue.opacity(0.3))
                .clipShape(.rect(cornerRadius: 20))
            
            Button("Write & Read") {
                do {
                    try FileManager.default.encodeToDocumentsDirectory(userInput, fileName: "message.txt")
                    readFromDocuments = try FileManager.default.decodeFromDocumentsDirectory(for: "message.txt") 
                } catch {
                    print(error.localizedDescription)
                }
            }.disabled(userInput.isEmpty)
            
            if let readFromDocuments {
                Text("Read from Documents Directory:")
                    .font(.caption)
                Text(readFromDocuments)
            }
        }
        
    }
}

#Preview {
    EnhancedWritingDataToDocumentsDirectoryView()
}
