//
//  ProductInCoreDataVM.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 12.04.23.
//

import Foundation
import CoreData

class ProductInCoreDataVM: ObservableObject {
    @Published var productDetails_CD: [ProductProductDetails] = []
    @Published var cd_productVM = [CD_ProductViewModel]()

    // Verbindung mit der CoreData Datenbank
    private let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "ShopAppModel")
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Fehler beim Laden des Stores: \(error.localizedDescription)")
            }
        }
        fetchProducts()
    }
    
    // Funktion, um alle Produkte zu erhalten
    func getAllProducts() {
        DispatchQueue.main.async {
            self.cd_productVM = self.productDetails_CD.map(CD_ProductViewModel.init)
        }
    }

    // Funktion, um Produkte aus der Datenbank abzurufen
    func fetchProducts() {
        let fetchRequest: NSFetchRequest<ProductProductDetails> = ProductProductDetails.fetchRequest()
        do {
            productDetails_CD = try persistentContainer.viewContext.fetch(fetchRequest)
            cd_productVM = productDetails_CD.compactMap { CD_ProductViewModel(productFromCD: $0) }
        } catch let error {
            print("Fehler beim Abrufen von Produkten: \(error.localizedDescription)")
            // Fehlerbehandlung, falls erforderlich
        }
    }

    // Funktion zum Speichern von Produkten in der Datenbank
    func saveProduct(name: String, price: Double, description: String, appearanceIds: String, defaultAppearanceId: String, ideaID: String, mainDesignID: String, productTypeID: String, sellableID: String) {
        let product = ProductProductDetails(context: persistentContainer.viewContext)
        product.name = name
        product.productPrice = "\(price)"
        product.productProuctDescription = description
        product.productAppearanceIds = appearanceIds
        product.productDefaultAppearanceId = defaultAppearanceId
        product.productIdeaId = ideaID
        product.productMainDesignId = mainDesignID
        product.productProductTypeId = productTypeID
        product.productSellableId = sellableID
        //muss noch implementiert werden weil es in der ProductDetailView noch nicht angelegt ist.
        //product.productSizeIds = sizeIDs
        
        do {
            try persistentContainer.viewContext.save()
            productDetails_CD.append(product)
            cd_productVM.append(CD_ProductViewModel(productFromCD: product))
        } catch let error {
            print("Fehler beim Speichern des Produkts: \(error.localizedDescription)")
            // Fehlerbehandlung, falls erforderlich
        }
    }
    
    // Funktion zum Löschen von Produkten aus der Datenbank
    func deleteProduct(at index: Int) {
        let product = productDetails_CD[index]
        persistentContainer.viewContext.delete(product)
        do {
            try persistentContainer.viewContext.save()
            productDetails_CD.remove(at: index)
            cd_productVM.remove(at: index)
        } catch let error {
            print("Fehler beim Löschen des Produkts: \(error.localizedDescription)")
            // Fehlerbehandlung, falls erforderlich
        }
    }
}



struct CD_ProductViewModel {
    
    let productFromCD : ProductProductDetails
    
    var productID: NSManagedObjectID {
        return productFromCD.objectID
    }
    
    var cd_producName: String {
        return productFromCD.name ?? ""
    }
    
    var cd_productPrice: String {
        return productFromCD.productPrice ?? ""
    }
    
    var cd_productDescription: String {
        return productFromCD.productProuctDescription ?? ""
    }
    
    var cd_productAppearanceIds: String {
        return productFromCD.productAppearanceIds ?? ""
    }
    
    var cd_productDefaultAppearanceId: String {
        return productFromCD.productDefaultAppearanceId ?? ""
    }
    
    var cd_productIdeaId: String {
        return productFromCD.productIdeaId ?? ""
    }
    
    var cd_productMainDesignId: String {
        return productFromCD.productMainDesignId ?? ""
    }
    
    var cd_productProductTypeId: String {
        return productFromCD.productProductTypeId ?? ""
    }
    
    var cd_productSellableId: String {
        return productFromCD.productSellableId ?? ""
    }
    
    var cd_productSizeID: String {
        return productFromCD.productSizeIds ?? ""
    }
    
    
}
