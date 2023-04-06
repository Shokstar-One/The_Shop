//
//  SlideShowView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 30.03.23.
//

import SwiftUI

struct SlideShowView: View {
    @EnvironmentObject var productVM: ProductDetailViewModel
    var selectedSellable: Sellable
    
    
    var body: some View {
        let myImageURL = "https://image.spreadshirtmedia.net/image-server/v1/products/T1351A2PA5869PT17X6Y0D300128136W27495H39850/views/1,width=650,height=650,appearanceId=2,backgroundColor=2b2b2b,crop=detail,modelId=3896/totenkopf-und-pistolen-fuer-chronisch-genervte-menschen-die-einfach-nur-ihre-ruhe-haben-wollen-von-dem-designer-shokstar-geildesignt.jpg"
        
        VStack {
            Image(systemName: "photo")
                .asyncData(imageUrl: "\(myImageURL)" )
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .cornerRadius(25)
                
              

                
           
//            Image(systemName: "photo")
//                .asyncData(imageUrl: "\(String(describing: productVM.selectedProduct?.productImages))" )
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300, height: 300)
//                .cornerRadius(25)
//            
//                .onAppear{
//                    
//                    var imageString: () =  productVM.fetchProduct(sellableId: selectedSellable.sellableId , productAppearanceIds: selectedSellable.defaultAppearanceId , productIdeaId: selectedSellable.ideaId )
//                    
//                    
//                    print("IMMMAGGGGEEEE SLLLLIIIIIDDDEEEEEEE: \(imageString)")
//                }
           
        } // VStack
        
        
        
    }
    
    
}

struct SlideShowView_Previews: PreviewProvider {
    static var previews: some View {
        let spd = PreviewDummieCode()
        SlideShowView(selectedSellable: spd.sellablePD)
            .environmentObject(ProductDetailViewModel())
    }
}
