//
//  RowHeaderView.swift
//  SwiftUISpreadSheet
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI
import SimultaneouslyScrollView
import Introspect

struct RowHeaderView: View {
    let simultaneouslyScrollViewHandlerV: SimultaneouslyScrollViewHandler
    let numberArray: [String]
    @Binding var scrollId: Bool
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView([.vertical], showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(numberArray, id: \.self) { (number: String) in
                        ZStack() {
                            Rectangle()
                                .stroke(.white)
                            Text(number)
                                .foregroundColor(.white)
                                .padding(10)
                                .frame(width: 50, height: 40, alignment: .center)
                        }
                        .id(number)
                        .background(Color.blue)
                    }
                }
                .frame(width: 50)
            }
            .introspectScrollView { simultaneouslyScrollViewHandlerV.register(scrollView: $0) }
            .onChange(of: scrollId) { scrollId in
                DispatchQueue.main.async {
                    withAnimation(.default.speed(0.3)) {
                        scrollViewProxy.scrollTo("25", anchor: .bottomLeading)
                    }
                }
            }
        }
    }
}

struct RowHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RowHeaderView(simultaneouslyScrollViewHandlerV: SimultaneouslyScrollViewHandlerFactory.create(), numberArray: ["1", "2", "3", "4", "5"], scrollId: .constant(true))
    }
}
