//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Stoyan Hristov on 6.02.26.
//

import SwiftUI

struct FetchingDataFromURL: View {
    @State var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) {result in
            
            VStack(alignment: .leading) {
                Text(result.trackName)
                    .font(.headline)
                Text(result.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let iCloudUrl = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
              return
        }
        
        do {
            let (fetchedData, _) = try await URLSession.shared.data(from: iCloudUrl)
            
            if let decodedFetchedData = try? JSONDecoder().decode(Response.self, from: fetchedData) {
                results = decodedFetchedData.results
            }
            
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    FetchingDataFromURL()
}
