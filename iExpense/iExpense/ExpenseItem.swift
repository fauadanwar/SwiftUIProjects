//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Fauad Anwar on 17/02/23.
//

import Foundation

// Creating a new property with a special type. For this app, we want it to work with Doubles.
var dollarFormat : FloatingPointFormatStyle<Double>.Currency {
   // Magic spell here
   // not sure what goes here, but we KNOW we need to return a FloatingPointFormatStyle.
    if #available(iOS 16, *) {
        return FloatingPointFormatStyle<Double>.Currency(code: Locale.current.currency?.identifier ?? "INR")
    } else {
        // Fallback on earlier versions
        return FloatingPointFormatStyle<Double>.Currency(code: Locale.current.currencyCode ?? "INR")
    }
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
