//
//  JSONDecoderCodable.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 20/02/23.
//

import SwiftUI

struct SingerCard: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct JSONDecoderCodable: View {
    
    @State private var showAlert = false
    @State private var addressString = ""

    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let singer = try? decoder.decode(SingerCard.self, from: data) {
                addressString = singer.address.street
                showAlert.toggle()
            }
        }
        .alert("Address is", isPresented: $showAlert) {
            Button("Ok", role: .cancel) { }
        } message: {
            Text(addressString)
        }
    }
}

struct JSONDecoderCodable_Previews: PreviewProvider {
    static var previews: some View {
        JSONDecoderCodable()
    }
}
