//
//  StrokeBorder.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 05/03/23.
//

import SwiftUI

struct StrokeBorder: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(.blue, lineWidth: 40)
            
            Circle()
                .strokeBorder(.blue, lineWidth: 40)
            
            ArcRotationAdjustment(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(.blue, lineWidth: 40)
                .frame(width: 200, height: 200)
        }
    }
}

struct StrokeBorder_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorder()
    }
}
