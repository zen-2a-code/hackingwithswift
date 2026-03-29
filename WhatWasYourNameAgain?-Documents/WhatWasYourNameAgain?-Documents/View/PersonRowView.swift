//
//  PersonRowView.swift
//  WhatWasYourNameAgain?-Documents
//
//  Created by Stoyan Hristov on 20.03.26.
//

import SwiftUI

struct PersonRowView: View {
    var person: Person
    var body: some View {
        NavigationLink {
            PersonDetailsView(person: person)
        } label: {
            HStack{
                Image(uiImage: UIImage(data: person.imageData) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(.circle)
                    .shadow(radius: 2)
                Spacer()
                Text(person.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    NavigationStack {
        List {
            PersonRowView(person: Person.example)
                .navigationTitle("What was your name again?")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
