//
//  BundleJSONLoader.swift
//  FriendsBook
//
//  Created by Stoyan Hristov on 22.02.26.
//

import Foundation

enum BundleJSONLoader {
    static func load<T: Decodable>(_ fileName: String, as type: T.Type) -> T {
        guard let url =  Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError(fileName + " not found in bundle")
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(type.self, from: data)
            
        } catch {
            fatalError("Failed to load/decode from url: \(url)")
        }
    }
}
