//
//  UserDefaultAppState.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 17/02/23.
//

import SwiftUI

struct UserDefaultAppState: View {
    
    @State private var tapCountUserDefault = UserDefaults.standard.integer(forKey: "tapCountUserDefault")
    @AppStorage("tapCountStState")  private var tapCountStState = 0

    var body: some View {
        VStack{
            Button("Tap count User Default: \(tapCountUserDefault)") {
                tapCountUserDefault += 1
                UserDefaults.standard.set(self.tapCountUserDefault, forKey: "tapCountUserDefault")
            }
            .padding(10)
            Button("Tap count At State: \(tapCountStState)") {
                tapCountStState += 1
            }
            .padding(10)
        }
    }
}

struct UserDefaultAppState_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultAppState()
    }
}
