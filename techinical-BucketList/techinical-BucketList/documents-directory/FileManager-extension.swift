//
//  FileManager-extension.swift
//  techinical-BucketList
//
//  Created by Stoyan Hristov on 11.03.26.
//

import Foundation


extension FileManager {
    func decodeFromDocumentsDirectory<T: Decodable>(for fileName: String) throws -> T  {
        let url = URL.documentsDirectory.appending(path: fileName)
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func encodeToDocumentsDirectory<T: Encodable>(_ value: T, fileName: String) throws {
        let url = URL.documentsDirectory.appending(path: fileName)
        let encodedData = try JSONEncoder().encode(value)
        try encodedData.write(to: url, options: [.atomic, .completeFileProtection])
    }
}
