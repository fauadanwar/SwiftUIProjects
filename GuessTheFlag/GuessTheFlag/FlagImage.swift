//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Fauad Anwar on 17/01/23.
//

import SwiftUI

struct FlagImage: View {
    var countrieName: String

    var body: some View {
        Image(countrieName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(color: .white, radius: 5)
            .environment(\.colorScheme, .dark)
            .shadow(color: .black, radius: 5)
            .environment(\.colorScheme, .light)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(countrieName: "France")
    }
}
