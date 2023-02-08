//
//  AnimationBinding.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 06/02/23.
//

import SwiftUI

struct AnimationBinding: View {
    @State private var animationAmount = 1.0

       var body: some View {
           VStack {
               Stepper("Scale amount", value: $animationAmount.animation(
                   .easeInOut(duration: 1)
                       .repeatCount(3, autoreverses: true)
               ), in: 1...10)
               
               Spacer()

               Button("Tap Me") {
                   animationAmount += 1
               }
               .padding(40)
               .background(.red)
               .foregroundColor(.white)
               .clipShape(Circle())
               .scaleEffect(animationAmount)
           }
       }
}

struct AnimationBinding_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBinding()
    }
}
