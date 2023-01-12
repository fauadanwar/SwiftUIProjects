//
//  Alert.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 12/01/23.
//

import SwiftUI

struct Alert: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        Alert()
    }
}
