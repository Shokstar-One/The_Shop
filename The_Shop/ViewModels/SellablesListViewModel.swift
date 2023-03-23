//
//  SellablesListViewModel.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation
import Combine
import SwiftUI

class SellablesListViewModel: ObservableObject {
    
    @Published var theSellablesListFromVM = [SellableViewModel]()
    
    // MARK: ist nicht nötig, da das sellable direkt an die ProductDetailView übergeben wird
//    @Published var selectedSellable: SellableViewModel?

    @Published var error: IdentifiableError?
    
    
//    // Setzt das ausgewählte Produkt auf Basis eines Product-Objekts.
//    func setSellable(_ sellable: Sellable) {
//        selectedSellable = SellableViewModel(sellable: sellable)
//    }
    
//    init(theSellablesListFromVM: [SellableViewModel] = [SellableViewModel](), selectedSellable: SellableViewModel? = nil, error: IdentifiableError? = nil) {
//        self.theSellablesListFromVM = theSellablesListFromVM
//        self.selectedSellable = selectedSellable
//        self.error = error
//    }
 
    
    func fetchSellables() {
        guard let url = URL(string: Constants.API_URL) else {
            self.error = IdentifiableError(message: "Invalid URL: \(Constants.API_URL)")
            return
        }
        
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "An error occurred: \(error.localizedDescription)")
                }
                return
            }
            
            print("fetchSellables: \(url)")
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "No data received from server.")
                }
                return
            }
            
            do {
                let sellablesResponse = try JSONDecoder().decode(SellableResponse.self, from: data)
                let sellableViewModels = sellablesResponse.sellables.map { SellableViewModel(sellableResponse: sellablesResponse, sellable: $0) }
                DispatchQueue.main.async {
                    self.theSellablesListFromVM = sellableViewModels
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = IdentifiableError(message: "Error decoding sellables response: \(error.localizedDescription)")
                }
                return
            }
        }
        
        task.resume()
    }

    
}


struct SellableViewModel: Identifiable, Decodable {
    var id = UUID() // Eine Identifikationsvariable wird erstellt und mit einer zufälligen UUID initialisiert.
    let sellableResponse: SellableResponse // Eine Konstante, die die Antwort eines verkäuflichen Objekts enthält.
    let sellable: Sellable // Eine Konstante, die das verkäufliche Objekt enthält.
    
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencyCode = sellable.price.currencyId
        return formatter.string(from: NSNumber(value: sellable.price.amount)) ?? ""
    }
    //----------------| SellableRespone |----------------
    
    // Die Anzahl der Verkaufsbaren wird hier zurückgegeben.
    var count: Int {
        sellableResponse.count
    }
    
    // Die Begrenzung der Verkaufsbaren wird hier zurückgegeben.
    var limit: Int {
        sellableResponse.limit
    }
    
    // Die Verschiebung der Verkaufsbaren wird hier zurückgegeben.
    var offset: Int? {
        sellableResponse.offset
    }
    
    //----------------| Sellable |----------------
    
    // Eine Liste von allen Sellables im aktuellen SellableResponse
    var sellables: [Sellable]? {
        sellableResponse.sellables
    }
    
    // Die eindeutige ID des Sellables
    var sellableId: String {
        sellable.sellableId
    }
    
    // Die ID der Idee, zu der das Sellable gehört
    var ideaId: String {
        sellable.ideaId
    }
    
    // Die ID des Hauptdesigns des Sellables
    var mainDesignId: String {
        sellable.mainDesignId
    }
    
    // Die ID des Produkttyps, zu dem das Sellable gehört
    var productTypeId: String{
        sellable.productTypeId
    }
    
    //----------------| Price |----------------
    
    // Eine berechnete Variable, die die Währung als String zurückgibt.
    var currencyId: String {
        sellable.price.currencyId
    }
    // Der Preis des Sellables
    var price: Price {
        sellable.price
    }
    
    // Der Name des Sellables
    var name: String {
        sellable.name
    }
    
    // Eine Beschreibung des Sellables
    var description: String {
        sellable.description
    }
    
    // Eine Liste von Schlagwörtern, die das Sellable beschreiben
    var tags: [String] {
        sellable.tags
    }
    
    
    // Eine Liste von Appearance-IDs, die zum Sellable gehören
    var appearanceIds: [String] {
        sellable.appearanceIds
    }
    
    // Die ID der Standard-Appearance des Sellables
    var defaultAppearanceId: String {
        sellable.defaultAppearanceId
    }
    
    
    //----------------| PreviewImage |----------------
    
    // Eine berechnete Variable, die den Typ des Vorschaubildes als String zurückgibt.
    var type: String {
        sellable.previewImage.type
    }
    
    // Ein Vorschaubild des Sellables
    var previewImage: PreviewImage {
        sellable.previewImage
    }
    
    // Ein Vorschaubild des Sellables
    var previewImageURL: String {
        sellable.previewImage.url
    }
    
    
}

