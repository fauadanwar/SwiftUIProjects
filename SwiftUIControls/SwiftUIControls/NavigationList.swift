//
//  NavigationList.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 20/02/23.
//

import SwiftUI

struct NavigationList: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("SwiftUI")
        }
    }
}

struct NavigationList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationList()
    }
}
