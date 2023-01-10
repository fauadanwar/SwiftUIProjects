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
    var unitsArray = [Dimension]()
    private let formatter: MeasurementFormatter

    init() {
        var unitTypes = [UnitType]()
        for unitType in UnitType.allCases {
            unitTypes.append(unitType)
        }
        self.unitTypes = unitTypes
        
        formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = Int.max
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }

    func unitsArray(unitType: UnitType) -> [Dimension] {
        switch unitType {
        case .temperature:
            unitsArray = [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
        case .length:
            unitsArray = [UnitLength.megameters, UnitLength.kilometers, UnitLength.hectometers, UnitLength.decameters, UnitLength.meters, UnitLength.decimeters, UnitLength.centimeters, UnitLength.millimeters, UnitLength.micrometers, UnitLength.nanometers, UnitLength.picometers, UnitLength.inches, UnitLength.feet, UnitLength.yards, UnitLength.miles, UnitLength.scandinavianMiles, UnitLength.lightyears, UnitLength.nauticalMiles, UnitLength.fathoms, UnitLength.furlongs, UnitLength.astronomicalUnits, UnitLength.parsecs]
        case .time:
            unitsArray = [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds, UnitDuration.milliseconds, UnitDuration.microseconds, UnitDuration.nanoseconds, UnitDuration.picoseconds]
        case .volume:
                unitsArray = [UnitVolume.megaliters, UnitVolume.kiloliters, UnitVolume.liters, UnitVolume.deciliters, UnitVolume.centiliters, UnitVolume.milliliters, UnitVolume.cubicKilometers, UnitVolume.cubicMeters, UnitVolume.cubicDecimeters, UnitVolume.cubicCentimeters, UnitVolume.cubicMillimeters, UnitVolume.cubicInches, UnitVolume.cubicFeet, UnitVolume.cubicYards, UnitVolume.cubicMiles, UnitVolume.acreFeet, UnitVolume.bushels, UnitVolume.teaspoons, UnitVolume.tablespoons, UnitVolume.fluidOunces, UnitVolume.cups, UnitVolume.pints, UnitVolume.quarts, UnitVolume.gallons, UnitVolume.imperialTeaspoons, UnitVolume.imperialTablespoons, UnitVolume.imperialFluidOunces, UnitVolume.imperialPints, UnitVolume.imperialQuarts, UnitVolume.imperialGallons, UnitVolume.metricCups]
        }
        return unitsArray
    }
    
    func getStringValue(unit: Dimension) -> String {
        formatter.unitStyle = .long
        return formatter.string(from: unit).capitalized
    }
    
    func getUnitValue(unitType: UnitType, conversionFromUnit: Dimension, conversionToUnit: Dimension, fromValue: Double) -> String {
        formatter.unitStyle = .medium
        let fromMeasurement = Measurement(value: fromValue, unit: conversionFromUnit)
        let toMeasurement = fromMeasurement.converted(to: conversionToUnit)
        return formatter.string(from: toMeasurement)
    }
}
