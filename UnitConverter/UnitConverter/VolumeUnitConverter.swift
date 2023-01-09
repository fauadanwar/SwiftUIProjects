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
    
    func getToUnitValue(conversionFromUnit: String, conversionToUnit: String, fromValue: Double) -> String {
        if let fromUnit = VolumeUnit(rawValue: conversionFromUnit)
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
            return getFormattedString(fromMeasurement: fromMeasurement, conversionToUnit: conversionToUnit)
        }
        return "Failed to convert"
    }
    
    private func getFormattedString(fromMeasurement: Measurement<UnitVolume>, conversionToUnit: String) -> String {
        let mf = MeasurementFormatter()
        mf.numberFormatter.maximumFractionDigits = Int.max
        mf.unitOptions = .providedUnit
        if let toUnit = VolumeUnit(rawValue: conversionToUnit)
        {
            switch toUnit {
            case .milliliters:
                return mf.string(from: fromMeasurement.converted(to: UnitVolume.milliliters))
            case .liters:
                return mf.string(from: fromMeasurement.converted(to: UnitVolume.liters))
            case .cups:
                return mf.string(from: fromMeasurement.converted(to: UnitVolume.cups))
            case .pints:
                return mf.string(from: fromMeasurement.converted(to: UnitVolume.pints))
            case .gallons:
                return mf.string(from: fromMeasurement.converted(to: UnitVolume.gallons))
            }
        }
        return "Failed to convert"
    }
}
