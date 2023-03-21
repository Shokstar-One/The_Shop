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
    
    // Ruft die Produktdaten ab.
    func fetchProduct() {
        guard let url = URL(string: Constants.PRODUCT_DETAIL_URL) else {
            self.error = IdentifiableError(message: "Ungültige URL.")
            return
        }
        
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
    var formattedPrice: String {
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
    var productType: String {
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


