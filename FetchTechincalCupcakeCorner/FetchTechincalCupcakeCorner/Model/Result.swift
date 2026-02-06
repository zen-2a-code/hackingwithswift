//
//  Result.swift
//  CupcakeCorner
//
//  Created by Stoyan Hristov on 6.02.26.
//

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
