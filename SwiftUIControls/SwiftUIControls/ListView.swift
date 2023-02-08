//
//  ListView.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 04/02/23.
//

import SwiftUI

struct ListView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    let colors: [Color] = [.red, .green, .blue, .yellow]

    var body: some View {
        VStack
        {
            List {
                Section {
                    ForEach(colors, id:\.self) {
                       Color(UIColor($0))
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0,
                                                      leading: 15,
                                                      bottom: 0,
                                                      trailing: 15))
                    }
                } header: {
                    ZStack{
                        Color(.orange)
                        Text("Colours")
                            .padding(10)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0,
                                              leading: 15,
                                              bottom: 0,
                                              trailing: 15))
                }
            }

            List {
                Text("Static Row")
                ForEach(people, id: \.self) {
                    Text($0)
                }
                Text("Static Row")
            }
            List {
                Text("Static row 1")
                Text("Static row 2")
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
                Text("Static row 3")
                Text("Static row 4")
            }
            List {
                Section("Section 1") {
                    Text("Static row 1")
                    Text("Static row 2")
                }
                Section("Section 2") {
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }
                Section("Section 3") {
                    Text("Static row 3")
                    Text("Static row 4")
                }
            }
        }
        .listStyle(.grouped)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
