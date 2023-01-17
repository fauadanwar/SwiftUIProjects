//
//  ViewsAsProperties.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 17/01/23.
//

import SwiftUI

struct ViewsAsProperties: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var motto3: some View {
        Text("Luminus")
    }
    
    var spells: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var alpha: some View {
            Text("A")
            Text("B")
    }
    
    var body: some View {
        VStack {
            VStack {
                motto1
                    .foregroundColor(.red)
                motto2
                    .foregroundColor(.blue)
                motto3
                    .foregroundColor(.green)
                spells
                alpha
            }
            HStack
            {
                spells
                alpha
            }
        }
    }
}

struct ViewsAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsProperties()
    }
}
