//
//  AddBookView.swift
//  Bookworm
//
//  Created by Stoyan Hristov on 12.02.26.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
    
    static func isValidBook(title: String, author: String) -> Bool {
        if title.isEmpty || author.isEmpty {
            return false
        } else {
            return true
        }
    }
}

