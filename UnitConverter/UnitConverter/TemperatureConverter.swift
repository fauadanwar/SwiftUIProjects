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
    
    func getToUnitValue(conversionFromUnit: String, conversionToUnit: String, fromValue: Double) -> Measurement<UnitTemperature>? {
        
        if let fromUnit = TemperatureUnit(rawValue: conversionFromUnit),
           let toUnit = TemperatureUnit(rawValue: conversionToUnit)
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
            
            switch toUnit {
            case .celsius:
                return fromMeasurement.converted(to: UnitTemperature.celsius)
            case .fahrenheit:
                return fromMeasurement.converted(to: UnitTemperature.fahrenheit)
            case .kelvin:
                return fromMeasurement.converted(to: UnitTemperature.kelvin)
            }
        }
        return nil
    }
}
