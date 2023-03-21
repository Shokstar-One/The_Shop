//
//  ParentView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 17.03.23.
//

import SwiftUI

struct ParentView: View {
    // Instanz von SellablesListViewModel erstellen
    @StateObject var sellablesListVM = SellablesListViewModel()
    
    // Instanz von ProductDetailViewModel erstellen
    @StateObject var productDetailVM = ProductDetailViewModel()
    // Körper der Ansicht
    
    var body: some View {
        
        // Instanz von SellablesListView zurückgeben
        SellablesListView()
        // SellablesListViewModel als Umgebungsobjekt setzen
            .environmentObject(sellablesListVM)
        // ProductDetailViewModel als Umgebungsobjekt setzen
            .environmentObject(productDetailVM)
    }
}


struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
