//
//  PathTriangle.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 05/03/23.
//

import SwiftUI

struct PathTriangle: View {
    var body: some View {
        VStack
        {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 50))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 300, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 50))
            }
            .fill(.blue)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 50))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 300, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 50))
                path.closeSubpath()
            }
            .stroke(.blue, lineWidth: 10)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 50))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 300, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 50))
                path.closeSubpath()
            }
            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        }
    }
}

struct PathTriangle_Previews: PreviewProvider {
    static var previews: some View {
        PathTriangle()
    }
}
