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
    
    @Published var productImage: UIImage?
    
    // Das aktuell ausgewählte Produkt.
    @Published var selectedProduct: ProductViewModel?
    
    // Eine Fehlermeldung, die angezeigt wird, wenn beim Abrufen der Daten ein Fehler aufgetreten ist.
    @Published var error: IdentifiableError?
    
    // Setzt das ausgewählte Produkt auf Basis eines Product-Objekts.
    func setProduct(_ product: Product) {
        selectedProduct = ProductViewModel(product: product)
    }
    
    // Ruft die Produktdaten ab.
    func fetchProduct(sellableId: String, productAppearanceIds: String, productIdeaId: String ) {
        // Überprüfen, ob die URL gültig ist
        guard let url = URL(string: "\(Constants.PRODUCT_DETAIL_URL)\(sellableId)?appearanceId=\(productAppearanceIds)&ideaId=\(productIdeaId)&apikey=\(Constants.API_KEY)") else {
            self.error = IdentifiableError(message: "Ungültige URL.")
            return
        }
        
        // Datenabfrage an den Server senden
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Fehler bei der Verbindung mit dem Server
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "\(error)")
                }
                return
            }
            print("URL aus fetchProduct: \(url)")
            
            // Überprüfen, ob die Serverantwort gültig ist
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "Ungültige Serverantwort.")
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "Fehlerhafte Serverantwort: \(httpResponse.statusCode)")
                }
                return
            }
            
            // Überprüfen, ob Daten empfangen wurden
            guard let data = data else {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "Keine Daten empfangen.")
                }
                return
            }
            
            print("DATA BOY: \(data)")
            
            // Daten in ein Produktobjekt umwandeln
            do {
                let productResponse = try JSONDecoder().decode(Product.self, from: data)
                let productViewModel = ProductViewModel(product: productResponse)
                DispatchQueue.main.async {
                    self.selectedProduct = productViewModel
                }
                print("SelectedProduct: \(String(describing: self.selectedProduct))")
            } catch {
                // Fehler beim Parsen der Daten
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "\(error)")
                }
                return
            }
        }
        // Datenabfrage starten
        task.resume()
    }
    
    
}

// Das ViewModel für ein einzelnes Produkt.
struct ProductViewModel: Identifiable, Decodable{
    
    var id = UUID()
    
    // Das zugrunde liegende Product-Objekt.
    var product: Product
    
    // Der formatierte Preis des Produkts.
    var productFormattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "de_DE")
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
        product.images.map { ProductImageViewModel( imageURL: $0.url, imageType: $0.type) }
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
class ProductImageViewModel: Identifiable, Hashable, Equatable {
    static func == (lhs: ProductImageViewModel, rhs: ProductImageViewModel) -> Bool {
        return lhs.id == rhs.id && lhs.imageURL == rhs.imageURL && lhs.imageType == rhs.imageType
    }
    
    // Die eindeutige ID des Bilds.
    var id = UUID()
    
    // Die URL des Produktbilds.
    var imageURL: String
    
    // Der Typ des Produktbilds.
    var imageType: String
    
    init(id: UUID = UUID(), imageURL: String, imageType: String) {
        self.id = id
        self.imageURL = imageURL
        self.imageType = imageType
    }
    
    // Funktion zum Hashing von Bildern.
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension ProductViewModel: RandomAccessCollection {
    
    // Definieren des Index-Typs.
    typealias Index = Int
    
    // Start-Index der Bildliste.
    var startIndex: Index {
        return productImages.startIndex
    }
    
    // End-Index der Bildliste.
    var endIndex: Index {
        return productImages.endIndex
    }
    
    // Subscript-Funktion zum Abrufen von Bildern anhand ihres Index.
    subscript(position: Index) -> ProductImageViewModel {
        return productImages[position]
    }
}


