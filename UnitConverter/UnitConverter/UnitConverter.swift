//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by Fauad Anwar on 09/01/23.
//

import Foundation

enum UnitType: String, CaseIterable {
    case temperature = "Temperature"
    case length = "Length"
    case time = "Time"
    case volume = "Volume"
}

class UnitConverter {
    
    let unitTypes: [UnitType]
    lazy var temperatureConverter = TemperatureConverter()
    lazy var lengthConverter = LengthConverter()
    lazy var timeConverter = TimeConverter()
    lazy var volumeConverter = VolumeUnitConverter()

    init() {
        var unitTypes = [UnitType]()
        for unitType in UnitType.allCases {
            unitTypes.append(unitType)
        }
        self.unitTypes = unitTypes
    }

    func unitsArray(unitType: UnitType) -> [String] {
        var unitsArray = [String]()
        switch unitType {
        case .temperature:
            for temperatureUnit in temperatureConverter.temperatureUnits {
                unitsArray.append(temperatureUnit.rawValue)
            }
        case .length:
            for lengthUnit in lengthConverter.lengthUnits {
                unitsArray.append(lengthUnit.rawValue)
            }
        case .time:
            for timeUnit in timeConverter.timeUnits {
                unitsArray.append(timeUnit.rawValue)
            }
        case .volume:
            for volumeUnit in volumeConverter.volumeUnits {
                unitsArray.append(volumeUnit.rawValue)
            }
        }
        return unitsArray
    }
    
    func defaultValue(unitType: UnitType) -> String {
        switch unitType {
        case .temperature:
            return temperatureConverter.temperatureUnits.first?.rawValue ?? "Unknown"
        case .length:
            return lengthConverter.lengthUnits.first?.rawValue ?? "Unknown"
        case .time:
            return timeConverter.timeUnits.first?.rawValue ?? "Unknown"
        case .volume:
            return volumeConverter.volumeUnits.first?.rawValue ?? "Unknown"
        }
    }
    
    func getUnitValue(unitType: UnitType, conversionFromUnit: String, conversionToUnit: String, fromValue: Double) -> String {
        switch unitType {
        case .temperature:
            return temperatureConverter.getToUnitValue(conversionFromUnit: conversionFromUnit, conversionToUnit: conversionToUnit, fromValue: fromValue)
        case .length:
            return lengthConverter.getToUnitValue(conversionFromUnit: conversionFromUnit, conversionToUnit: conversionToUnit, fromValue: fromValue)
        case .time:
            return timeConverter.getToUnitValue(conversionFromUnit: conversionFromUnit, conversionToUnit: conversionToUnit, fromValue: fromValue)
        case .volume:
            return volumeConverter.getToUnitValue(conversionFromUnit: conversionFromUnit, conversionToUnit: conversionToUnit, fromValue: fromValue)
        }
    }
}
