//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Stoyan Hristov on 16.04.26.
//

import SwiftUI

enum SortType {
    case regular, alphabetical, country
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State var searchFilter = ""
    @State private var favorites = Favorites()
    @State private var sortOrder = SortType.regular

    var filteredResorts: [Resort] {
        if searchFilter.isEmpty {
            resorts
        } else {
            resorts.filter {
                $0.name.localizedStandardContains(searchFilter)
            }
        }
    }

    var sortResorts: [Resort] {
        guard sortOrder != .regular else { return filteredResorts }
        return filteredResorts.sorted { lhs, rhs in
            switch sortOrder {
            case .regular:
                fatalError("Unreachable")
            case .alphabetical:
                lhs.name < rhs.name
            case .country:
                lhs.country < rhs.country
            }
        }
    }

    var body: some View {
        NavigationSplitView {
            List(sortResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .navigationTitle("Resorts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button {
                            sortOrder = .regular
                        } label: {
                            Label("Default", systemImage: "receipt")
                        }

                        Button {
                            sortOrder = .alphabetical
                        } label: {
                            Label(
                                "Alphabetical",
                                systemImage: "characters.uppercase"
                            )
                        }

                        Button {
                            sortOrder = .country
                        } label: {
                            Label(
                                "Country",
                                systemImage: "mappin.and.ellipse.circle"
                            )
                        }
                    } label: {
                        Label("Options", systemImage: "ellipsis.circle")
                    }
                }
            }
            .searchable(text: $searchFilter, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
