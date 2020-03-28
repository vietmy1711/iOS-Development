//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "82934B42-6C75-43A3-93AE-7BB0B3635C50"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice (for currency: String) {
        let urlString = ("\(baseURL)/\(currency)?apikey=\(apiKey)")
        performRequest(with: urlString, currency: currency)
    }
    
    func performRequest(with urlString: String, currency: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    self.delegate?.didUpdatePrice(currency: currency, price: self.parseJSON(safeData)!)
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            return decodedData.rate
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
   
}

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdatePrice(currency: String, price: Double)
}
