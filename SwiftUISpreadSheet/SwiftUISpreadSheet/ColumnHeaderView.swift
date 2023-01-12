//
//  ColumnHeaderView.swift
//  SwiftUISpreadSheet
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI
import SimultaneouslyScrollView
import Introspect
struct ColumnHeaderView: View {
    let simultaneouslyScrollViewHandlerH: SimultaneouslyScrollViewHandler
    let charecterArray: [String]
    
    var body: some View {
        ScrollView([.horizontal], showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 0, pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(charecterArray, id: \.self) { (charecter: String) in
                        ZStack() {
                            Rectangle()
                                .stroke(.white)
                            Text(charecter)
                                .foregroundColor(.white)
                                .padding(10)
                                .frame(width: 150, height: 40, alignment: .center)
                        }
                        .id(charecter)
                        .background(Color.blue)
                    }
                } header: {
                    OriginView()
                }
            }
            .frame(height: 40)
        }
        .introspectScrollView { simultaneouslyScrollViewHandlerH.register(scrollView: $0) }

    }
}

struct ColumnHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnHeaderView(simultaneouslyScrollViewHandlerH: SimultaneouslyScrollViewHandlerFactory.create(), charecterArray: ["A", "B", "C", "D", "E"])
    }
}
