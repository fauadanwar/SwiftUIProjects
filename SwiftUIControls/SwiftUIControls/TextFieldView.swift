//
//  TextFieldView.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 02/01/23.
//

import SwiftUI

struct TextFieldView: View {
    @State private var name = ""

    var body: some View {
        NavigationView {
            Form{
                TextField("Enter name here", text: $name)
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.small)
                        .foregroundColor(.accentColor)
                    Text("Hello, \(name)!")
                }
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
