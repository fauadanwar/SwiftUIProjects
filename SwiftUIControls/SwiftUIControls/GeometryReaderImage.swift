//
//  GeometryReaderImage.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 20/02/23.
//

import SwiftUI

struct GeometryReaderImage: View {
    var body: some View {
        GeometryReader { geo in
            Image("bgImage")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct GeometryReaderImage_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderImage()
    }
}
