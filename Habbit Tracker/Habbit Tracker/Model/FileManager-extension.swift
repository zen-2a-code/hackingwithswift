//
//  FileManager-extension.swift
//  Habbit Tracker
//
//  Created by Stoyan Hristov on 4.02.26.
//

import SwiftUI

extension FileManager {
    static var documentsDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
