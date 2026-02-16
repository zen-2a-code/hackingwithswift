//
//  AddBookView.swift
//  Bookworm
//
//  Created by Stoyan Hristov on 12.02.26.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextField("Add review", text: $review, axis: .vertical)
                    
                    StarsRatingView(selectedRating: $rating, label: "Select rating:")
                }
                
                Section {
                    Button("Save") {
                        let currentBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        
                        modelContext.insert(currentBook)
                        
                        dismiss()
                    }
                }
                .disabled(!Book.isValidBook(title: title, author: author))
            }
            .navigationTitle("Add Book")
            
        }
    }
}

#Preview {
    AddBookView()
}
