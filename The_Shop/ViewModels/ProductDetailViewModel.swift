//
//  ProductDetailViewModel.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 14.03.23.
//

import Foundation


//
//  SellablesListViewModel.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation
import Combine
import SwiftUI

// Das ViewModel für die Produktdetailansicht.
class ProductDetailViewModel: ObservableObject {
    
    @Published var productDetailViewModel: ProductDetailViewModel?
    
    // Das aktuell ausgewählte Produkt.
    @Published var selectedProduct: ProductViewModel?
    
    // Eine Fehlermeldung, die angezeigt wird, wenn beim Abrufen der Daten ein Fehler aufgetreten ist.
    @Published var error: IdentifiableError?
    
    // Neue Eigenschaft, um das ausgewählte Sellable-Objekt zu speichern.
      var selectedSellable: Sellable?
    
    // Setzt das ausgewählte Produkt auf Basis eines Product-Objekts.
    func setProduct(_ product: Product) {
        selectedProduct = ProductViewModel(product: product)
    }
    
    //N02abp1xnxSjx7Jywby7-812-7?appearanceId=1&ideaId=62a46a3628f4aa0fbe2b00de&apikey=?SprdAuth%20apiKey=%22b1271341-2d14-468b-a6ed-d28ba13034c0%22
    
    // Ruft die Produktdaten ab.
    
    //TO DO: sellableId, productAppearanceIds, productIdeaId
    func fetchProduct(sellableId: String, productAppearanceIds: String, productIdeaId: String ) {
        guard let url = URL(string: "\(Constants.PRODUCT_DETAIL_URL)\(sellableId)?appearanceId=\(productAppearanceIds)&ideaId=\(productIdeaId)&apikey=\(Constants.API_KEY)") else {
            self.error = IdentifiableError(message: "Ungültige URL.")
            return
        }
        print("DIE URL AUS DEM FETCHPRODUCT: \(url)")
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "\(error)")
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "Keine Daten empfangen.")
                    //print(response)
                }
                return
            }
            
            do {
                let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                let productViewModel = ProductViewModel(product: productResponse.product)
                DispatchQueue.main.async {
                    self.selectedProduct = productViewModel
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "\(error)")
                    //print(data, error)
                }
                return
            }
        }
        
        task.resume()
    }
    
}


// Das ViewModel für ein einzelnes Produkt.
struct ProductViewModel {
  
    // Das zugrunde liegende Product-Objekt.
    let product: Product
    
    // Der formatierte Preis des Produkts.
    var productFormattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = product.price.currencyId
        let priceString = formatter.string(from: NSNumber(value: product.price.amount)) ?? "\(product.price.amount)"
        return priceString
    }
    
    // Der Name des Produkts.
    var productName: String {
        product.name
    }
    
    // Die Beschreibung des Produkts.
    var productDescription: String {
        product.description
    }
    
    // Die URL des Vorschaubilds des Produkts.
    var productPreviewImageURL: String {
        product.previewImage.url
    }
    
    // Die IDs der verfügbaren Erscheinungen des Produkts.
    var productAppearanceIds: [String] {
        product.appearanceIds
    }
    
    // Die ID der Standard-Erscheinung des Produkts.
    var defaultAppearanceId: String {
        product.defaultAppearanceId
    }
    
    // Der Typ des Produkts.
    var productTypeID: String {
        product.productTypeId
    }
    
    // Eine Liste der verfügbaren Größen-IDs für das Produkt.
    var productSizeIds: [String] {
        product.sizeIds
    }
    
    // Eine Liste der ViewModel-Objekte für die Produktbilder des Produkts.
    var productImages: [ProductImageViewModel] {
        product.images.map { ProductImageViewModel(productImage: $0) }
    }
    
    // Diese Variable gibt die ideaId des Produkts zurück
    var productIdeaId: String {
        product.ideaId
    }

    // Diese Variable gibt die mainDesignId des Produkts zurück
    var productMainDesignID: String {
        product.mainDesignId
    }

    // Diese Variable gibt ein Array mit den tags des Produkts zurück
    var tags: [String] {
        product.tags
    }

    // Diese Variable gibt die sellableId des Produkts zurück
    var productSellableId: String {
        product.sellableId
    }
    
}

// Das ViewModel für ein einzelnes Produktbild.
struct ProductImageViewModel: Identifiable {
    var id = UUID()

    // Das zugrunde liegende ProductImage-Objekt.
    let productImage: ProductImage
    
    // Die URL des Produktbilds.
    var imageURL: String {
        productImage.url
    }
    
    // Der Typ des Produktbilds.
    var imageType: String {
        productImage.type
    }
}


