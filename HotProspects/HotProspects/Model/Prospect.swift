//
//  Prospect.swift
//  HotProspects
//
//  Created by Stoyan Hristov on 25.03.26.
//

import SwiftData
import Foundation

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var createdDate: Date
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.createdDate = Date()
    }
}
