//
//  StepperView.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 22/01/23.
//

import SwiftUI

struct StepperView: View {
    @State private var sleepAmount = 8.0

    var body: some View {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            .padding()
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
