//
//  APIHandler.swift
//  Exchanger
//
//  Created by Content Arcade on 11/05/2023.
//

import Foundation
import Alamofire


class APIHandler {
    
    //Convert One currency to another....
    func fetchExchangeRate(to: String, from: String, amount: Double, completion: @escaping(Double) -> Void) {
        let url = "\(Constants.convert)to=\(to)&from=\(from)&amount=\(amount)&apikey=\(Constants.apiKey)"
        
        AF.request(url).responseDecodable(of: ExchangeRate.self) { response in
            switch response.result {
            case .success(let value):
                completion(value.result)
            case .failure(let error):
                print("Exchange Rates API request failed with error: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchSymbols(completion: @escaping (CurrencySymbols) -> Void) {
        let url = "\(Constants.symbols)"
        let headers: HTTPHeaders = ["apikey": Constants.apiKey ]
        AF.request(url, headers: headers).responseDecodable(of: CurrencySymbols.self) { response in
            switch response.result {
            case .success(let value):
                print("Exchange rate: \(value.symbols)")
                completion(value)
            case .failure(let error):
                print("Symbols API request failed with error: \(error.localizedDescription)")
            }
        }
    }
   
    func fetchLatest(base: String, symbols: String, completion: @escaping (Rates) -> Void) {
        let url = "\(Constants.latest)symbols=\(symbols)&base=\(base)"
        let headers: HTTPHeaders = ["apikey": Constants.apiKey]
        AF.request(url, headers: headers).responseDecodable(of: LatestRates.self) { response in
            switch response.result {
            case .success(let value):
                completion(value.rates)
            case .failure(let error):
                print("Latest Rates API request failed with error: \(error)")
            }
        }
    }

    
}
