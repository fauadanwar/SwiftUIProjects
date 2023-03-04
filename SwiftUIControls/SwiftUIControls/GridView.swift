//
//  GridView.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 20/02/23.
//

import SwiftUI

struct GridView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
