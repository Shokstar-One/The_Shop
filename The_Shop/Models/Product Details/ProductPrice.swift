//
//  ProductPrice.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 14.03.23.
//

import Foundation

struct ProductPrice: Decodable {
    let amount: Double        // Der Betrag des Preises
    let currencyId: String    // Die Währung des Preises, z.B. "USD" oder "EUR"
}

