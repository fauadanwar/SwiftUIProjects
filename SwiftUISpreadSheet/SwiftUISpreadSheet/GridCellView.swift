//
//  GridCellView.swift
//  SwiftUISpreadSheet
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI
import SimultaneouslyScrollView
import Introspect

struct GridCellView: View {
    let simultaneouslyScrollViewHandlerV: SimultaneouslyScrollViewHandler
    let simultaneouslyScrollViewHandlerH: SimultaneouslyScrollViewHandler
    let numberArray: [String]
    let charecterArray: [String]
    @Binding var scrollId: Bool

    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView([.horizontal], showsIndicators: false) {
                ScrollView([.vertical], showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 0) {
                        ForEach(charecterArray, id: \.self) { (charecter: String) in
                            LazyVStack(alignment: .leading, spacing: 0) {
                                ForEach(numberArray, id: \.self) { (number: String) in
                                    ZStack() {
                                        Rectangle()
                                            .stroke(.blue)
                                        Text(number + charecter)
                                            .foregroundColor(.blue)
                                            .padding(10)
                                            .frame(width: 150, height: 40, alignment: .center)
                                    }
                                    .background(Color.white)
                                    .id(number + charecter)
                                }
                            }
                        }
                    }
                }
                .introspectScrollView { simultaneouslyScrollViewHandlerV.register(scrollView: $0) }
            }
            .onChange(of: scrollId) { scrollId in
                DispatchQueue.main.async {
                    withAnimation(.default.speed(0.3)) {
                        scrollViewProxy.scrollTo("25X", anchor: .bottomLeading)
                    }
                }
            }
            .introspectScrollView { simultaneouslyScrollViewHandlerH.register(scrollView: $0) }
        }
    }
}

struct GridCellView_Previews: PreviewProvider {
    static var previews: some View {
        GridCellView(simultaneouslyScrollViewHandlerV: SimultaneouslyScrollViewHandlerFactory.create(), simultaneouslyScrollViewHandlerH: SimultaneouslyScrollViewHandlerFactory.create(), numberArray: ["1", "2", "3", "4", "5"], charecterArray: ["A", "B", "C", "D", "E"], scrollId: .constant(true))
    }
}
