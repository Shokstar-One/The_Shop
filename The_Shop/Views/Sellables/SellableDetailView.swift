//
//  SellableDetailView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 10.03.23.
//

import SwiftUI

struct SellableDetailView: View {
    let sellableVM: SellableViewModel

    
    var body: some View {
        VStack {
            
//            Image(systemName: "photo")
//                .data(url: URL(string: sellableVM.previewImageURL))
            Image(systemName: "photo")
                .asyncData(imageUrl: sellableVM.previewImageURL)
                .scaledToFit()
                .cornerRadius(25)
                .padding()

            Text(sellableVM.name)
                .font(.title)
                .padding(.bottom)
            
            Text(sellableVM.description)
                .font(.body)
                .padding(.horizontal)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(sellableVM.name)
    }
}

struct SellableDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let spd = PreviewDummieCode()
        let sellableVM = SellableViewModel(sellableResponse: spd.sellableResponsePD, sellable: spd.sellablePD)
        return SellableRowView(sellableVM: sellableVM)
    }
}
