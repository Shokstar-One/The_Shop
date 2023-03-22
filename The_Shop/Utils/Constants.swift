//
//  Constants.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation

struct Constants {
    let sellables: Sellable
    let sellablesResponse: SellableResponse
    let product : Product?
    init(sellables: Sellable, sellablesResponse: SellableResponse,  product: Product) {
        self.sellables = sellables
        self.sellablesResponse = sellablesResponse
        self.product = product
    }
    
    static let API_KEY = "SprdAuth%20apiKey=b1271341-2d14-468b-a6ed-d28ba13034c0"
    static let SECRET_KEY = "f2469a64-6535-40a0-8eea-8f604a7468fd"
    static let SHOP_ID = "100247767"
    static let BASE_URL = "https://api.spreadshirt.net/api/v1/shops/"
    
    
    static var API_URL: String {
        return "\(BASE_URL)\(SHOP_ID)/sellables?page=\(randomPage())&\(API_KEY)"
    }
    //funktion schreiben, eventuell mit "Did Set" 
    static var PRODUCT_DETAIL_URL: String {
     
     
        return "\(BASE_URL)/\(SHOP_ID)/sellables/"
    }
   // "https://api.spreadshirt.net/api/v1/shops/100247767/sellables/N02abp1xnxSjx7Jywby7-812-7?appearanceId=1&ideaId=62a46a3628f4aa0fbe2b00de&apikey=?SprdAuth%20apiKey=%22b1271341-2d14-468b-a6ed-d28ba13034c0%22"
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
    
  
}

