//
//  OriginView.swift
//  SwiftUISpreadSheet
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI

struct OriginView: View {
    var body: some View {
        ZStack() {
            Rectangle()
                .stroke(.white)
            Image(systemName: "hand.draw.fill")
                .foregroundColor(.white)
                .padding(10)
                .frame(width: 50, height: 40, alignment: .center)
        }
        .background(Color.blue)
    }
}

struct OriginView_Previews: PreviewProvider {
    static var previews: some View {
        OriginView()
    }
}
