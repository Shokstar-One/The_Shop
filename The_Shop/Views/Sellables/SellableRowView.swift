//
//  SellableRowView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 10.03.23.
//

import SwiftUI

struct SellableRowView: View {
    //in der sellableVM müssen keine weiteren Daten zurückgegeben werden
    let sellableVM: SellableViewModel

    var body: some View {
        
        VStack {
            //                Image(systemName: "photo")
            //                    .data(url: URL(string: sellableVM.previewImageURL))
            //                    .resizable()
            //                    .scaledToFit()
           
            Text(sellableVM.name)
                .font(.title3)
            
            Image(systemName: "photo")
                .asyncData(imageUrl: sellableVM.previewImageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .cornerRadius(25)
        
            Rectangle()
                .fill(Color.red)
                        .frame(height: 32)
                        .cornerRadius(25)
                        .padding()
                        .overlay{
                            Text("Details")
                                .foregroundColor(Color.white)
                                .font(.title2)
                        }
        }
    }
    
}


struct SellableRowView_Previews: PreviewProvider {
    static var previews: some View {
        let spd = PreviewDummieCode()
        let sellableVM = SellableViewModel(sellableResponse: spd.sellableResponsePD, sellable: spd.sellablePD)
        return SellableRowView(sellableVM: sellableVM)
        
    }
}
