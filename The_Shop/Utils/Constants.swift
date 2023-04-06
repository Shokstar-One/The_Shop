//
//  Constants.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation

struct Constants {
    let sellables: Sellable // Objekt vom Typ Sellable
    let sellablesResponse: SellableResponse // Objekt vom Typ SellableResponse
    let product : Product? // Optionales Objekt vom Typ Product
    init(sellables: Sellable, sellablesResponse: SellableResponse,  product: Product) {
        self.sellables = sellables
        self.sellablesResponse = sellablesResponse
        self.product = product
    }
    
    // Konstanten definieren
    static let API_KEY = "SprdAuth%20apiKey=b1271341-2d14-468b-a6ed-d28ba13034c0"
    static let SECRET_KEY = "f2469a64-6535-40a0-8eea-8f604a7468fd"
    static let SHOP_ID = "100247767"
    static let BASE_URL = "https://api.spreadshirt.net/api/v1/shops/"
    
    static var PAGE_COUNT = "1"
    
    // URLs definieren
    static var API_URL: String {
        return "\(BASE_URL)\(SHOP_ID)/sellables?page=\(randomPage())&\(API_KEY)"
    }
    
    static var PRODUCT_DETAIL_URL: String {
        return "\(BASE_URL)\(SHOP_ID)/sellables/"
    }
    
    // Funktionen definieren
    static func randomPage() -> String {
        return String(Int.random(in: 0...48))
    }
    
    static func productAppearanceId(for product: Product) -> [String] {
        return product.appearanceIds
    }
    
    static func productSellableId (for product: Product) -> String {
        return product.sellableId
    }
    
    static func productIdeaId (for product: Product) -> String {
        return product.ideaId
    }
    
    static func pageLimit (for pagelimit: SellableResponse) -> String {
        return String(pagelimit.limit)
    }
}

