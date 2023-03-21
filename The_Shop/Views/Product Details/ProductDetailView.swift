//
//  ProductDetailView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 16.03.23.
//

import SwiftUI

struct ProductDetailView: View {
    // Das ViewModel für die Produktdetailansicht.
   // @ObservedObject var viewModel: ProductDetailViewModel
    
    // Zugriff auf den SellablesListViewModel, der das Array der verkaufbaren Produkte hält
    @EnvironmentObject var sellableVM: SellablesListViewModel
    // Zugriff auf den ProductDetailViewModel, der das selektierte Produkt hält
    @EnvironmentObject var productVM: ProductDetailViewModel
    
    // Neue Eigenschaft, um das ausgewählte Sellable-Objekt zu speichern.
      //var sellable: Sellable
    var body: some View {
        VStack {
            // Überprüfen, ob ein ausgewähltes Produkt vorhanden ist.
            if let product = productVM.selectedProduct {
                ScrollView {
                    // Das Vorschaubild des Produkts anzeigen.
                    Image(product.productPreviewImageURL)
                        .aspectRatio(contentMode: .fit)
                    
                    // Die Produktdetails anzeigen.
                    Text(product.productName)
                        .font(.title)
                        .padding(.top, 20)
                    Text(product.formattedPrice)
                        .font(.headline)
                        .padding(.top, 10)
                    Text(product.productDescription)
                        .font(.body)
                        .padding(.top, 10)
                    
                    // Eine Liste der verfügbaren Größen anzeigen.
                    if !product.productSizeIds.isEmpty {
                        Text("Größen:")
                            .font(.headline)
                            .padding(.top, 20)
                        ForEach(product.productSizeIds, id: \.self) { sizeId in
                            Text(sizeId)
                                .font(.body)
                        }
                    }
                    
                    // Eine Liste der verfügbaren Ausführungen anzeigen.
                    if !product.productAppearanceIds.isEmpty {
                        Text("Ausführungen:")
                            .font(.headline)
                            .padding(.top, 20)
                        ForEach(product.productAppearanceIds, id: \.self) { appearanceId in
                            Text(appearanceId)
                                .font(.body)
                        }
                    }
                    
                    // Eine Liste der Produktbilder anzeigen.
                    if !product.productImages.isEmpty {
                        Text("Bilder:")
                            .font(.headline)
                            .padding(.top, 20)
                        ForEach(product.productImages) { imageViewModel in
                            Image(imageViewModel.imageURL)
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, 10)
                        }
                    }
                }
            } else if productVM.error != nil {
                // Eine Fehlermeldung anzeigen, wenn ein Fehler aufgetreten ist.
                //ErrorView(error: error)
                Text("error")
            } else {
                // Eine Ladeanzeige anzeigen, während die Daten abgerufen werden.
                ProgressView()
            }
        }
        .padding(20)
        // Den Hintergrund auf weiß setzen.
        .background(Color.white)
        // Den Titel der Navigationsleiste auf den Namen des Produkts setzen.
        .navigationBarTitle(productVM.selectedProduct?.productName ?? "")
        // Das Laden der Daten starten, sobald die View erscheint.
        .onAppear {
            productVM.fetchProduct()
        }
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(SellablesListViewModel())
            .environmentObject(ProductDetailViewModel())
    }
}
