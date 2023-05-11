//
//  Currencies.swift
//  Exchanger
//
//  Created by Content Arcade on 11/05/2023.
//

import Foundation

struct CurrencySymbols: Codable {
    let success: Bool
    let symbols: Symbols
}

struct Symbols: Codable {
    let aed, afn, all, amd: String

    enum CodingKeys: String, CodingKey {
        case aed = "AED"
        case afn = "AFN"
        case all = "ALL"
        case amd = "AMD"
    }
}
