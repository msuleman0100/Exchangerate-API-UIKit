//
//  LatestRates.swift
//  Exchanger
//
//  Created by Content Arcade on 11/05/2023.
//

import Foundation

struct LatestRates: Codable {
    let base, date: String
    let rates: Rates
    let success: Bool
    let timestamp: Int
}

struct Rates: Codable {
    let eur, gbp, jpy: Double

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
        case gbp = "GBP"
        case jpy = "JPY"
    }
}
