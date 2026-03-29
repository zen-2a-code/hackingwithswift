//
//  GridView.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 25.01.26.
//

import SwiftUI

struct MissionsGridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()

                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formatedLunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
        }
        .navigationDestination(for: Mission.self) { mission in
            MissionDetailsView(mission: mission, astronauts: astronauts)
        }
        .padding([.horizontal, .bottom])
    }
}


#Preview {
     let missions: [Mission] = Bundle.main.decode("missions.json")
     let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionsGridView(missions: missions, astronauts: astronauts)
}
