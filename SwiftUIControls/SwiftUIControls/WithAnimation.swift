//
//  WithAnimation.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 06/02/23.
//

import SwiftUI

struct WithAnimation: View {
    
    @State private var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation(.interpolatingSpring(stiffness: 20, damping: 1) .speed(0.90)) {
                    animationAmount += 10
                }
                withAnimation(.interpolatingSpring(stiffness: 20, damping: 1) .speed(0.95)) {
                    animationAmount -= 10
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 0, z: 1))
            
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(.default, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        }
    }
}

struct WithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WithAnimation()
    }
}
