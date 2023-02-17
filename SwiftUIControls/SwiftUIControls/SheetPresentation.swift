//
//  SheetPresentation.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 16/02/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String

    var body: some View {
        VStack{
            Text("Hello \(name)")

            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct SheetPresentation: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Fouad")
        }
    }
}

struct SheetPresentation_Previews: PreviewProvider {
    static var previews: some View {
        SheetPresentation()
    }
}
