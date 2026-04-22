//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Stoyan Hristov on 21.04.26.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(Favorites.self) var favorites

    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()

                HStack {
                    if dynamicTypeSize > .large
                        && horizontalSizeClass == .compact
                    {
                        VStack(spacing: 10) {
                            ResortDetailsView(resort: resort)
                        }
                        VStack(spacing: 10) { SkiDetailsView(resort: resort) }

                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }

                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)

                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)

                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                Button(
                    favorites.contains(resort)
                        ? "Remove from Favorites" : "Add to Favorites"
                ) {
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(
            selectedFacility?.name ?? "More information",
            isPresented: $showingFacility,
            presenting: selectedFacility
        ) { _ in
        } message: { unwrappedFacility in
            Text(unwrappedFacility.description)
        }
    }
}

#Preview {
    NavigationStack {
        ResortView(resort: .example)
            .environment(Favorites())
    }
}
