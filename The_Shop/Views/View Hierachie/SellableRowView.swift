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
            

//            Text(sellableVM.name)
//                .font(.title3)
            HStack {
            Image(systemName: "photo")
                .asyncData(imageUrl: sellableVM.previewImageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .cornerRadius(25)
        
                // Füge einen Text hinzu.
                Text("      ")
                    .foregroundColor(.white)
                    .padding(.horizontal, 48 )
                    .padding(.vertical, 16)
            } // VStack
            // Setze den Hintergrund mit einer Kapselform und einem Farbverlauf.
            .background(LinearGradient(colors: [.gradientGray, .clear], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
            .shadow(color: .black.opacity(0.6), radius: 10, x:5, y: 20)
                }
                }
        } // VStack
   



struct SellableRowView_Previews: PreviewProvider {
    static var previews: some View {
        let spd = PreviewDummieCode()
        let sellableVM = SellableViewModel(sellableResponse: spd.sellableResponsePD, sellable: spd.sellablePD)
        return SellableRowView(sellableVM: sellableVM)
        
    }
}
