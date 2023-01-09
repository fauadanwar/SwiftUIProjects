//
//  LengthConverter.swift
//  UnitConverter
//
//  Created by Fauad Anwar on 09/01/23.
//

import Foundation

enum LengthUnit: String, CaseIterable {
    case meters = "Meters"
    case kilometers = "Kilometers"
    case feet = "Feet"
    case yards = "Yards"
    case miles = "Miles"
}

struct LengthConverter {
    let lengthUnits: [LengthUnit]
    
    init() {
        var lengthUnits = [LengthUnit]()
        for lengthUnit in LengthUnit.allCases {
            lengthUnits.append(lengthUnit)
        }
        self.lengthUnits = lengthUnits
    }
    
    func getToUnitValue(conversionFromUnit: String, conversionToUnit: String, fromValue: Double) -> String {
        
        if let fromUnit = LengthUnit(rawValue: conversionFromUnit)
        {
            var fromMeasurement: Measurement<UnitLength>
            switch fromUnit {
            case .meters:
                fromMeasurement = Measurement(value: fromValue, unit: UnitLength.meters)
            case .kilometers:
                fromMeasurement = Measurement(value: fromValue, unit: UnitLength.kilometers)
            case .feet:
                fromMeasurement = Measurement(value: fromValue, unit: UnitLength.feet)
            case .yards:
                fromMeasurement = Measurement(value: fromValue, unit: UnitLength.yards)
            case .miles:
                fromMeasurement = Measurement(value: fromValue, unit: UnitLength.miles)
            }
            return getFormattedString(fromMeasurement: fromMeasurement, conversionToUnit: conversionToUnit)
        }
        return "Failed to convert"
    }
    
    private func getFormattedString(fromMeasurement: Measurement<UnitLength>, conversionToUnit: String) -> String {
        let mf = MeasurementFormatter()
        mf.numberFormatter.maximumFractionDigits = Int.max
        mf.unitOptions = .providedUnit
        if let toUnit = LengthUnit(rawValue: conversionToUnit)
        {
            switch toUnit {
            case .meters:
                return mf.string(from: fromMeasurement.converted(to: UnitLength.meters))
            case .kilometers:
                return mf.string(from: fromMeasurement.converted(to: UnitLength.kilometers))
            case .feet:
                return mf.string(from: fromMeasurement.converted(to: UnitLength.feet))
            case .yards:
                return mf.string(from: fromMeasurement.converted(to: UnitLength.yards))
            case .miles:
                return mf.string(from: fromMeasurement.converted(to: UnitLength.miles))
            }
        }
        return "Failed to convert"
    }
}
