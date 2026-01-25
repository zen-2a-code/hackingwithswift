//
//  CrewHorizontalScrollView.swift
//  Moonshot
//
//  Created by Stoyan Hristov on 25.01.26.
//

import SwiftUI

struct CrewScrollView: View {
    var crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
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
}
