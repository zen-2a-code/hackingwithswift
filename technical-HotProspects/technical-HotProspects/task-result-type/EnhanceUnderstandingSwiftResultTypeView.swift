//
//  UnderstandingSwiftResultTypeView.swift
//  technical-HotProspects
//
//  Created by Stoyan Hristov on 23.03.26.
//

import SwiftUI

struct EnhanceUnderstandingSwiftResultTypeView: View {
    @State private var result: Result<String, Error>?
    
    var body: some View {
        VStack {
            QuickTestView(result: result)
        }
        .task  {
            await fetchReadings()
        }
    }
    
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        self.result = result
    }
}

#Preview {
    EnhanceUnderstandingSwiftResultTypeView()
}
