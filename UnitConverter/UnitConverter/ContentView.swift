//
//  ContentView.swift
//  UnitConverter
//
//  Created by Fauad Anwar on 08/01/23.
//

import SwiftUI

struct ContentView: View {
    
    let unitConverter = UnitConverter()
    @FocusState private var valueIsFocused: Bool
    @State private var valueFromConvert: Double = 0.0
    @State private var unitType: UnitType = .temperature
    @State private var conversionFromUnit: Dimension = UnitTemperature.celsius
    @State private var conversionToUnit: Dimension = UnitTemperature.fahrenheit
    private var valueToConvert: String {
        return unitConverter.getUnitValue(unitType: unitType, conversionFromUnit: conversionFromUnit, conversionToUnit: conversionToUnit, fromValue: valueFromConvert)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Unit Type", selection: $unitType) {
                        ForEach(unitConverter.unitTypes, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .onChange(of: unitType) { newValue in
                        conversionFromUnit = unitConverter.unitsArray[0]
                        conversionToUnit = unitConverter.unitsArray[1]
                    }
                }
                Section {
                    Picker("From Unit", selection: $conversionFromUnit) {
                        ForEach(unitConverter.unitsArray(unitType: unitType), id: \.self) {
                            Text(unitConverter.getStringValue(unit: $0))
                        }
                    }
                    TextField("Value", value: $valueFromConvert, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                }
                Section {
                    Picker("To Unit", selection: $conversionToUnit) {
                        ForEach(unitConverter.unitsArray(unitType: unitType), id: \.self) {
                            Text(unitConverter.getStringValue(unit: $0))
                        }
                    }
                    Text(valueToConvert)
                }
            }
            .navigationTitle("Unit Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
