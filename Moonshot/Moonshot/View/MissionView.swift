//
//  MissionView.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 24.01.26.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
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
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(crew, id: \.role) {crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 30)
                                                .strokeBorder(.white.opacity(0.5))
                                        }
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                        Text(crewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
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
