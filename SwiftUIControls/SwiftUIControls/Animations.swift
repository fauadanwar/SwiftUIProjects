//
//  Animations.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 06/02/23.
//

import SwiftUI

struct Animations: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            HStack {
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(35)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .animation(.default, value: animationAmount)
                //        .blur(radius: (animationAmount - 1) * 3)
                
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(35)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .animation(.easeOut, value: animationAmount)
            }
            HStack {
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(35)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .animation(.interpolatingSpring(stiffness: 35, damping: 1), value: animationAmount)
                
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(35)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .animation(
                    .easeInOut(duration: 2)
                    .delay(1),
                    value: animationAmount
                )
            }
            HStack {
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(35)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true),
                    value: animationAmount
                )
                
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(35)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(),
                    value: animationAmount
                )
            }
            HStack {
                Button("Tap Me") {
//                    animationAmount += 1
                }
                .padding(35)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeOut(duration: 1)
                                .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
                .onAppear {
                    animationAmount = 2
                }
            }
        }
    }
}

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}
