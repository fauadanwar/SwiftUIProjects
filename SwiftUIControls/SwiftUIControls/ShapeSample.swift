//
//  ShapeSample.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 05/03/23.
//

import SwiftUI
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}

struct ArcRotationAdjustment: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ShapeSample: View {
    var body: some View {
       VStack {
            Triangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
           
           Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
               .stroke(.blue, lineWidth: 10)
               .frame(width: 200, height: 200)
           
           ArcRotationAdjustment(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
               .stroke(.blue, lineWidth: 10)
               .frame(width: 200, height: 200)
        }
    }
}

struct ShapeSample_Previews: PreviewProvider {
    static var previews: some View {
        ShapeSample()
    }
}
