//
//  Price.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation

struct Price: Decodable {
    let amount: Double        // Der Betrag des Preises
    let currencyId: String    // Die Währung des Preises, z.B. "USD" oder "EUR"
    
}
