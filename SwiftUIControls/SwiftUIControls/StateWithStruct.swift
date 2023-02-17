//
//  StateWithStruct.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 16/02/23.
//

import SwiftUI

struct User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct StateWithStruct: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding(10)
    }
}

struct StateWithStruct_Previews: PreviewProvider {
    static var previews: some View {
        StateWithStruct()
    }
}
