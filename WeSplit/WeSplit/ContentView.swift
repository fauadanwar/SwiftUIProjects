//
//  ContentView.swift
//  WeSplit
//
//  Created by Fauad Anwar on 31/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form{
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.small)
                        .foregroundColor(.accentColor)
                    Text("Hello, World!")
                }
            }
            .navigationTitle("Greetings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
