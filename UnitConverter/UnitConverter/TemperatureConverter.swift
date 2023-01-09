//
//  TemperatureConverter.swift
//  UnitConverter
//
//  Created by Fauad Anwar on 09/01/23.
//

import Foundation

enum TemperatureUnit: String, CaseIterable {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
}

struct TemperatureConverter {
    let temperatureUnits: [TemperatureUnit]
    
    init() {
        var temperatureUnits = [TemperatureUnit]()
        for temperatureUnit in TemperatureUnit.allCases {
            temperatureUnits.append(temperatureUnit)
        }
        self.temperatureUnits = temperatureUnits
    }
    
    func getToUnitValue(conversionFromUnit: String, conversionToUnit: String, fromValue: Double) -> String {
        
        if let fromUnit = TemperatureUnit(rawValue: conversionFromUnit)
        {
            var fromMeasurement: Measurement<UnitTemperature>
            switch fromUnit {
            case .celsius:
                fromMeasurement = Measurement(value: fromValue, unit: UnitTemperature.celsius)
            case .fahrenheit:
                fromMeasurement = Measurement(value: fromValue, unit: UnitTemperature.fahrenheit)
            case .kelvin:
                fromMeasurement = Measurement(value: fromValue, unit: UnitTemperature.kelvin)
            }
            return getFormattedString(fromMeasurement: fromMeasurement, conversionToUnit: conversionToUnit)
        }
        return "Failed to convert"
    }
    
    private func getFormattedString(fromMeasurement: Measurement<UnitTemperature>, conversionToUnit: String) -> String {
        let mf = MeasurementFormatter()
        mf.numberFormatter.maximumFractionDigits = 0
        mf.unitOptions = .providedUnit
        if let toUnit = TemperatureUnit(rawValue: conversionToUnit)
        {
            switch toUnit {
            case .celsius:
                return mf.string(from: fromMeasurement.converted(to: UnitTemperature.celsius))
            case .fahrenheit:
                return mf.string(from: fromMeasurement.converted(to: UnitTemperature.fahrenheit))
            case .kelvin:
                return mf.string(from: fromMeasurement.converted(to: UnitTemperature.kelvin))
            }
        }
        return "Failed to convert"
    }
}
