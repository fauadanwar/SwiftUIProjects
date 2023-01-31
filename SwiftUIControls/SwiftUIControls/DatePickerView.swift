//
//  DatePickerView.swift
//  SwiftUIControls
//
//  Created by Fauad Anwar on 28/01/23.
//

import SwiftUI

struct DatePickerView: View {
    @State private var wakeUp = Date.now

    var body: some View {
        VStack {
            DatePicker("Please enter a date and time", selection: $wakeUp)
            DatePicker("Please enter a date and time", selection: $wakeUp)
                .labelsHidden()
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            DatePicker("Please enter a Date", selection: $wakeUp, displayedComponents: .date)
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
            DatePicker("Please enter a date", selection: $wakeUp, in: getRange(), displayedComponents: .date)
            Text(getDateStringFromComponents(date: getDateByComponenet()))
            Text(getDateByComponenet(), format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))


        }
    }
    func getDateByComponenet() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 17
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    func getDateStringFromComponents(date: Date) -> String {
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        return "Hour \(hour) + Minute \(minute)"
    }
    
    func getRange() -> ClosedRange<Date>  {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400 * 365)

        // create a range from those two
        return Date.now...tomorrow
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
