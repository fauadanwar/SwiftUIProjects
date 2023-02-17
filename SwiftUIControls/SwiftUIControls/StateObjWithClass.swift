//
//  StateObjWithClass.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 16/02/23.
//

import SwiftUI

class Hobbit: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct StateObjWithClass: View {
    
    @StateObject var hobbit = Hobbit()
    
    var body: some View {
        VStack {
            Text("Your name is \(hobbit.firstName) \(hobbit.lastName).")
            
            TextField("First name", text: $hobbit.firstName)
            TextField("Last name", text: $hobbit.lastName)
        }
        .padding(25)
    }
}

struct StateObjWithClass_Previews: PreviewProvider {
    static var previews: some View {
        StateObjWithClass()
    }
}
