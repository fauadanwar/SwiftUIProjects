//
//  VolumeUnitConverter.swift
//  UnitConverter
//
//  Created by Fauad Anwar on 09/01/23.
//

import Foundation

enum VolumeUnit: String, CaseIterable {
    case milliliters = "Milliliters"
    case liters = "Liters"
    case cups = "Cups"
    case pints = "Pints"
    case gallons = "Gallons"
}
struct VolumeUnitConverter {
    let volumeUnits: [VolumeUnit]
    
    init() {
        var volumeUnits = [VolumeUnit]()
        for volumeUnit in VolumeUnit.allCases {
            volumeUnits.append(volumeUnit)
        }
        self.volumeUnits = volumeUnits
    }
    
    func getToUnitValue(conversionFromUnit: String, conversionToUnit: String, fromValue: Double) -> Measurement<UnitVolume>? {
        if let fromUnit = VolumeUnit(rawValue: conversionFromUnit),
           let toUnit = VolumeUnit(rawValue: conversionToUnit)
        {
            var fromMeasurement: Measurement<UnitVolume>
            switch fromUnit {
            case .milliliters:
                fromMeasurement = Measurement(value: fromValue, unit: UnitVolume.milliliters)
            case .liters:
                fromMeasurement = Measurement(value: fromValue, unit: UnitVolume.liters)
            case .cups:
                fromMeasurement = Measurement(value: fromValue, unit: UnitVolume.cups)
            case .pints:
                fromMeasurement = Measurement(value: fromValue, unit: UnitVolume.pints)
            case .gallons:
                fromMeasurement = Measurement(value: fromValue, unit: UnitVolume.gallons)
            }
            switch toUnit {
            case .milliliters:
                return fromMeasurement.converted(to: UnitVolume.milliliters)
            case .liters:
                return fromMeasurement.converted(to: UnitVolume.liters)
            case .cups:
                return fromMeasurement.converted(to: UnitVolume.cups)
            case .pints:
                return fromMeasurement.converted(to: UnitVolume.pints)
            case .gallons:
                return fromMeasurement.converted(to: UnitVolume.gallons)
            }
        }
        return nil
    }
}
