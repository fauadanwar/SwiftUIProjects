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
    
    func getToUnitValue(conversionFromUnit: String, conversionToUnit: String, fromValue: Double) -> Measurement<UnitDuration>? {
        if let fromUnit = TimeUnit(rawValue: conversionFromUnit),
           let toUnit = TimeUnit(rawValue: conversionToUnit)
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
            }
            
            switch toUnit {
            case .picoseconds:
                return fromMeasurement.converted(to: UnitDuration.picoseconds)
            case .nanoseconds:
                return fromMeasurement.converted(to: UnitDuration.nanoseconds)
            case .microseconds:
                return fromMeasurement.converted(to: UnitDuration.microseconds)
            case .milliseconds:
                return fromMeasurement.converted(to: UnitDuration.milliseconds)
            case .seconds:
                return fromMeasurement.converted(to: UnitDuration.seconds)
            case .minutes:
                return fromMeasurement.converted(to: UnitDuration.minutes)
            case .hours:
                return fromMeasurement.converted(to: UnitDuration.hours)
            }
        }
        return nil
    }
}
