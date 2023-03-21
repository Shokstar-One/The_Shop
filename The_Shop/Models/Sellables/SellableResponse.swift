//
//  SellableResponse.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation

// Definiert eine Datenstruktur SellableResponse, die Decodable ist
public struct SellableResponse: Decodable {
    
    // Die Anzahl der Elemente in der Antwort
    let count: Int
    
    // Das Limit für die Anzahl der zurückgegebenen Elemente
    let limit: Int
    
    // Der Offset-Wert für die Antwort
    let offset: Int?
    
    // Ein Array von Sellable-Objekten
    let sellables: [Sellable]
}


