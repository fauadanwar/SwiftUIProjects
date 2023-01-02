//
//  ContentView.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 02/01/23.
//

import SwiftUI

struct PickerView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        NavigationView {
            Form{
                Picker("Selected Student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
