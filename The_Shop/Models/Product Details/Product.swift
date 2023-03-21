//
//  Product.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 14.03.23.
//

import Foundation

struct Product: Decodable {
    let sizeIds: [String] // Eine Liste von Größen-IDs für das Produkt
    let images: [ProductImage] // Eine Liste von Produktbildern für das Produkt
    let sellableId: String // Die Verkaufsbare-ID für das Produkt
    let ideaId: String // Die Idee-ID für das Produkt
    let mainDesignId: String // Die Hauptdesign-ID für das Produkt
    let productTypeId: String // Die Produkttyp-ID für das Produkt
    let price: ProductPrice // Der Preis für das Produkt
    let name: String // Der Name des Produkts
    let description: String // Die Beschreibung des Produkts
    let tags: [String] // Eine Liste von Schlagworten für das Produkt
    let previewImage: ProductImage // Das Vorschaubild für das Produkt
    let appearanceIds: [String] // Eine Liste von Erscheinungs-IDs für das Produkt
    let defaultAppearanceId: String // Die Standard-Erscheinungs-ID für das Produkt
}

