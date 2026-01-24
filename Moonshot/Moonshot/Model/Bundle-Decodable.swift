//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 22.01.26.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Unable to locate \(file) in the bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        do {
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "y-MM-dd"
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
