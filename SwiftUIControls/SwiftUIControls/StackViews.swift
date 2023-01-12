//
//  StackViews.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI

struct StackViews: View {
    var body: some View {
        VStack {
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack {
                Text("4")
                Text("5")
                Text("6")
            }
            HStack {
                Text("7")
                Text("8")
                Text("9")
            }
        }
    }
}

struct StackViews_Previews: PreviewProvider {
    static var previews: some View {
        StackViews()
    }
}
