//
//  TimeConverter.swift
//  UnitConverter
//
//  Created by Fauad Anwar on 09/01/23.
//

import Foundation

enum TimeUnit: String, CaseIterable {
    case picoseconds = "Picoseconds"
    case nanoseconds = "Nanoseconds"
    case microseconds = "Microseconds"
    case milliseconds = "Milliseconds"
    case seconds = "Seconds"
    case minutes = "Minutes"
    case hours = "Hours"
    case days = "Days"
}

struct TimeConverter {
    let timeUnits: [TimeUnit]
    
    init() {
        var timeUnits = [TimeUnit]()
        for timeUnit in TimeUnit.allCases {
            timeUnits.append(timeUnit)
        }
        self.timeUnits = timeUnits
    }
    
    func getToUnitValue(conversionFromUnit: String, conversionToUnit: String, fromValue: Double) -> String {
        if let fromUnit = TimeUnit(rawValue: conversionFromUnit)
        {
            var fromMeasurement: Measurement<UnitDuration>
            switch fromUnit {
            case .picoseconds:
                fromMeasurement = Measurement(value: fromValue, unit: UnitDuration.picoseconds)
            case .nanoseconds:
                fromMeasurement = Measurement(value: fromValue, unit: UnitDuration.nanoseconds)
            case .microseconds:
                fromMeasurement = Measurement(value: fromValue, unit: UnitDuration.microseconds)
            case .milliseconds:
                fromMeasurement = Measurement(value: fromValue, unit: UnitDuration.milliseconds)
            case .seconds:
                fromMeasurement = Measurement(value: fromValue, unit: UnitDuration.seconds)
            case .minutes:
                fromMeasurement = Measurement(value: fromValue, unit: UnitDuration.minutes)
            case .hours:
                fromMeasurement = Measurement(value: fromValue, unit: UnitDuration.hours)
            case .days:
                fromMeasurement = Measurement(value: fromValue * 24, unit: UnitDuration.hours)
            }
            return getFormattedString(fromMeasurement: fromMeasurement, conversionToUnit: conversionToUnit)
        }
        return "Failed to convert"
    }
    
    private func getFormattedString(fromMeasurement: Measurement<UnitDuration>, conversionToUnit: String) -> String {
        let mf = MeasurementFormatter()
        mf.numberFormatter.maximumFractionDigits = Int.max
        mf.unitOptions = .providedUnit
        if let toUnit = TimeUnit(rawValue: conversionToUnit)
        {
            switch toUnit {
            case .picoseconds:
                return mf.string(from: fromMeasurement.converted(to: UnitDuration.picoseconds))
            case .nanoseconds:
                return mf.string(from: fromMeasurement.converted(to: UnitDuration.nanoseconds))
            case .microseconds:
                return mf.string(from: fromMeasurement.converted(to: UnitDuration.microseconds))
            case .milliseconds:
                return mf.string(from: fromMeasurement.converted(to: UnitDuration.milliseconds))
            case .seconds:
                return mf.string(from: fromMeasurement.converted(to: UnitDuration.seconds))
            case .minutes:
                return mf.string(from: fromMeasurement.converted(to: UnitDuration.minutes))
            case .hours:
                return mf.string(from: fromMeasurement.converted(to: UnitDuration.hours))
            case .days:
                let numberOfDays = fromMeasurement.converted(to: UnitDuration.hours).value / 24
                return "\(numberOfDays.formatted()) " + (numberOfDays > 1 ? "Days" : "Day")
            }
        }
        return "Failed to convert"
    }
}
