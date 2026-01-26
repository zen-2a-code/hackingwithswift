//
//  GridView.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 25.01.26.
//

import SwiftUI

struct MissionsListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionDetailsView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack(spacing: 0) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 75)
                            .padding(.vertical, 5)
                            
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formatedLunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.lightBackground)
                    }
                    .frame(minHeight: 80)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}


#Preview {
     let missions: [Mission] = Bundle.main.decode("missions.json")
     let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionsListView(missions: missions, astronauts: astronauts)
}
