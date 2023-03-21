//
//  ProductImage.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 14.03.23.
//

import Foundation

struct ProductImage: Decodable {
    let url: String // URL der Produktabbildung
    let type: String // Typ der Produktabbildung (z.B. "jpg", "png" usw.)
}
