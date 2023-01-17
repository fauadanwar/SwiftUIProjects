//
//  EnvironmentModifiers.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 17/01/23.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .blur(radius: 1)
    }
}

struct EnvironmentModifiers_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiers()
    }
}
