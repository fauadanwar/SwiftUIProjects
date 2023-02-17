//
//  CodableJson.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 17/02/23.
//

import SwiftUI

struct Singer: Codable {
    let firstName: String
    let lastName: String
}
struct CodableJson: View {
    @State private var singer = Singer(firstName: "Taylor", lastName: "Swift")

    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(singer) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct CodableJson_Previews: PreviewProvider {
    static var previews: some View {
        CodableJson()
    }
}
