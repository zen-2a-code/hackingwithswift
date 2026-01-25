//
//  MissionView.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 24.01.26.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let astronauts: [String: Astronaut]
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.astronauts = astronauts
        
        self.crew = mission.crew.map { missionCrewMember in
            if let astronaut = astronauts[missionCrewMember.name] {
                return CrewMember(role: missionCrewMember.role, astronaut: astronaut)
            } else {
                fatalError("Missing Astronaut for \(missionCrewMember.name)")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, _ in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text("Lunch date: \(mission.formatedLunchDateBulgarian)")
                    .foregroundStyle(.secondary)
  
                VStack(alignment: .leading) {
                    DividerLine()
                    
                    Text("Mission highlights")
                        .font(.title.bold())
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                        .padding(.horizontal)
                    
                    DividerLine()
                }
                .padding(.horizontal)
             }
            .padding(.bottom)
            
            CrewScrollView(crew: crew)
         }
        .navigationTitle("\(mission.displayName)")
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
