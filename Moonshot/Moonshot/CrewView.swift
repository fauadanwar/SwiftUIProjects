//
//  CrewView.swift
//  Moonshot
//
//  Created by Fauad Anwar on 04/03/23.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [CrewMember]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Crew")
                .font(.title.bold())
                .foregroundColor(.white)
                .padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 1)
                                    )
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .background(.darkBackground)
    }
}

struct CrewView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        CrewView(crew: [CrewMember(role: "Commander", astronaut: astronauts["schirra"]!)])
    }
}
