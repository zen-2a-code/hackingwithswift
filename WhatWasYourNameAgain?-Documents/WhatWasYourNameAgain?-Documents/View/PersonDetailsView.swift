//
//  PersonDetailsView.swift
//  WhatWasYourNameAgain?-Documents
//
//  Created by Stoyan Hristov on 20.03.26.
//

import MapKit
import SwiftUI

struct PersonDetailsView: View {
    var person: Person
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Image(uiImage: UIImage(data: person.imageData) ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 2)
                
                
                VStack(spacing: 8) {
                    Text("Remember this person")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(person.name)
                        .font(.largeTitle.weight(.semibold))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.vertical, 60)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                
                HStack (spacing: 10) {
                    Image(systemName: "brain")
                        .foregroundStyle(.purple)
                    
                    Text("Try to connect the face with the name.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                if let lat = person.latitude,
                   let lon = person.longitude {
                    VStack {
                        Text("You probabbly met this person here?")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Map(initialPosition: MapCameraPosition.region(
                            MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon),
                                               span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))) {
                            Marker(person.name, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
                        }
                        .frame(height: 200)
                    }
                    .padding(.top, 20)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle(person.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
    }
}

#Preview {
    NavigationStack {
        PersonDetailsView(person: Person.example)
    }
}
