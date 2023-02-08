//
//  TransitionAnimation.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 07/02/23.
//

import SwiftUI

struct TransitionAnimation: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct TransitionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TransitionAnimation()
    }
}
