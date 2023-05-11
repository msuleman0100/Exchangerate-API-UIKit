//
//  ExchangeRate.swift
//  Exchanger
//
//  Created by Content Arcade on 11/05/2023.
//

import Foundation

struct ExchangeRate: Codable {
    let date: String?
    let historical: String?
    let info: Info
    let query: Query
    let result: Double
    let success: Bool
}

struct Info: Codable {
    let rate: Double
    let timestamp: Int
}

struct Query: Codable {
    let amount: Int
    let from, to: String
}
