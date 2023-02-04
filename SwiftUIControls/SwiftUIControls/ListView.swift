//
//  ListView.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 04/02/23.
//

import SwiftUI

struct ListView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        VStack
        {
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
