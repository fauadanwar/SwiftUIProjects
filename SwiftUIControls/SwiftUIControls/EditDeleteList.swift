//
//  EditDeleteList.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 16/02/23.
//

import SwiftUI

struct EditDeleteList: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }

                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("Number List")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct EditDeleteList_Previews: PreviewProvider {
    static var previews: some View {
        EditDeleteList()
    }
}
