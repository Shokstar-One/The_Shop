//
//  Sellable.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation

//----------| Diese Struktur definiert ein verkaufbares Produkt, das von der Decodable-Protokoll erbt, um aus JSON-Daten dekodiert zu werden. |----------
struct Sellable: Decodable{

    var sellableId: String // ID des verkaufbaren Produkts
    var ideaId: String // ID der Idee
    var mainDesignId: String // ID des Hauptdesigns
    var productTypeId: String // ID des Produkttyps
    var price: Price // Preis des Produkts
    var name: String // Name des Produkts
    var description: String // Beschreibung des Produkts
    var tags: [String] // Schlagwörter des Produkts
    var previewImage: PreviewImage // Vorschaubild des Produkts
    var appearanceIds: [String] // IDs der Designs
    var defaultAppearanceId: String // ID des Standarddesigns
    
}
