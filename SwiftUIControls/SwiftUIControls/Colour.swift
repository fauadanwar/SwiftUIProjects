//
//  Colour.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI

struct Colour: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                LinearGradient(gradient: Gradient(stops: [
                       .init(color: .white, location: 0.45),
                       .init(color: .black, location: 0.55),
                   ]), startPoint: .top, endPoint: .bottom)
                Color.red

            }
            VStack
            {
                Text("Your content")
                    .foregroundStyle(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
                Text("Your content")
                    .foregroundColor(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
        }
        .ignoresSafeArea()
    }
}

struct Colour_Previews: PreviewProvider {
    static var previews: some View {
        Colour()
    }
}
