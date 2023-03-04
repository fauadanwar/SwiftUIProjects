//
//  ContentView.swift
//  Moonshot
//
//  Created by Fauad Anwar on 18/02/23.
//

import SwiftUI
enum ViewTypes {
    case list
    case grid
}

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let viewTypes: [ViewTypes] = [.list, .grid]
    @State private var curruntVeiwType: ViewTypes = .list
    
    var body: some View {
        NavigationView {
            Group {
                if curruntVeiwType == .grid
                {
                    MissionGridView(astronauts: astronauts, missions: missions)
                }
                else
                {
                    MissionListView(astronauts: astronauts, missions: missions)
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationTitle("Moonshot")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Picker("Selected Student", selection: $curruntVeiwType) {
                    ForEach(viewTypes, id: \.self) {
                        switch $0
                        {
                        case .list:
                            Text("List")
                        case .grid:
                            Text("Grid")
                        }
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
