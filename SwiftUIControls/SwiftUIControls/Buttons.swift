//
//  Buttons.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack
        {
            Button("Button") {
                print("Button Pressed")
            }
            Button("Delete selection", role: .destructive, action: executeDelete)
            Button("Button 1") { }
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
            Button("Button 5") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(10)
            }
            Button {
                print("Edit")
            } label: {
                Image(systemName: "pencil")
                    .renderingMode(.original)// To show actual image instead of swift modified one
            }
            .buttonStyle(.bordered)

            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            .buttonStyle(.bordered)

        }
    }
    
    func executeDelete() {
        print("Now deleting…")
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
