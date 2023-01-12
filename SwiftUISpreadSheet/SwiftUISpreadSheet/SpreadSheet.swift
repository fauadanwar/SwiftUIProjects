//
//  SpreadSheet.swift
//  SwiftUISpreadSheet
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI

import SwiftUI
import SimultaneouslyScrollView
import Introspect

struct SpreadSheet: View {
    @State var scrollId: Bool = true
    let numbers = Array(0...50)
    var numberArray: [String] {
        numbers.map {
            String($0)
        }
    }
    let charecters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var charecterArray: [String] {
        charecters.map {
            String($0)
        }
    }
    let simultaneouslyScrollViewHandlerV = SimultaneouslyScrollViewHandlerFactory.create()
    let simultaneouslyScrollViewHandlerH = SimultaneouslyScrollViewHandlerFactory.create()

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                Button("Scroll") {
                    scrollId = Bool.random()
                }
                .frame(width: geometry.size.width, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(Color.blue)
                ColumnHeaderView(simultaneouslyScrollViewHandlerH: simultaneouslyScrollViewHandlerH, charecterArray: charecterArray)
                HStack(alignment: .top, spacing: 0) {
                    RowHeaderView(simultaneouslyScrollViewHandlerV: simultaneouslyScrollViewHandlerV, numberArray: numberArray, scrollId: $scrollId)
                    GridCellView(simultaneouslyScrollViewHandlerV: simultaneouslyScrollViewHandlerV, simultaneouslyScrollViewHandlerH: simultaneouslyScrollViewHandlerH, numberArray: numberArray, charecterArray: charecterArray, scrollId: $scrollId)
                }
            }
        }
    }
}

struct SpreadSheet_Previews: PreviewProvider {
    static var previews: some View {
        SpreadSheet()
    }
}
