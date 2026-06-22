//
//  CurrencyModel.swift
//  Mod6Proj
//

import Foundation

struct Currency {
    let name: String
    let symbol: String
    let rate: Double  // rate relative to 1 USD
}

struct CurrencyModel {
    
    // The four available currencies
    static let currencies: [Currency] = [
        Currency(name: "Euro",          symbol: "EUR", rate: 0.92),
        Currency(name: "British Pound", symbol: "GBP", rate: 0.79),
        Currency(name: "Japanese Yen",  symbol: "JPY", rate: 157.45),
        Currency(name: "Canadian Dollar", symbol: "CAD", rate: 1.36)
    ]
    
    // Convert a USD amount using the given currency's rate
    static func convert(usd: Int, to currency: Currency) -> String {
        let result = Double(usd) * currency.rate
        return String(format: "%.2f", result)
    }
}
