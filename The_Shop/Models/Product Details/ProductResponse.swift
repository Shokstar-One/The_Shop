//
//  ProductResponse.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 14.03.23.
//

import Foundation

// Eine Decodable-Struktur, die eine einzelne Product-Instanz repräsentiert.
public struct ProductResponse: Decodable {
    let product: Product // Das Product-Objekt innerhalb der Response.
}


