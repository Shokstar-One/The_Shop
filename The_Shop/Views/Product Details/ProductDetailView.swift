//
//  ProductDetailView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 16.03.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    //@EnvironmentObject var productVM: ProductDetailViewModel
    //    @EnvironmentObject var sellableVM: SellablesListViewModel
    
    @EnvironmentObject var productVM: ProductDetailViewModel
    // MARK: wird aus der listview übergeben
    var selectedSellable: Sellable
    @State private var images = [ProductImageViewModel]()
    @State private var currentPage = 0
    
    @State var productImages: [ProductImageViewModel] = []
    
    @State private var scale: CGFloat = 0.5
  
    
    var body: some View {
        
        
      VStack {
          HeaderLogoView()
            
          Text(productVM.selectedProduct?.productName ?? "Name")
              .font(.system(size: 30, weight: .heavy))

          
                    // Zeige alle Produktbilder an
                    let filteredImages = productVM.selectedProduct?.productImages.filter { ["DESIGN", "MODEL", "ALTERNATIVE_MODEL"].contains($0.imageType) } ?? []
                    
                 
                 
          VStack {
              ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 16) {
                                ForEach(filteredImages
                                        , id: \.self) { productImage in
                                    Image(systemName: "photo")
                                        .resizable()
                                        .asyncData(imageUrl: productImage.imageURL)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 400, height: 400, alignment: .center)
                                        .cornerRadius(25)
                                        .modifier(ImageModifier(contentSize: CGSize(width: 400.0, height:0.0)))
                                    
                                }
                            }
                        }
              .padding(.horizontal)
              
              // Zeige andere Produktinformationen an
 
        Text(productVM.selectedProduct?.productDescription ?? "Beschreibung")
        Text("\(productVM.selectedProduct?.productFormattedPrice ?? "") ")
   
          }
       
                   
               
                    
                    
                    
         

            
        } // VStack
        .onAppear {
            
        }
        .task{
            productVM.fetchProduct(sellableId: selectedSellable.sellableId , productAppearanceIds: selectedSellable.defaultAppearanceId , productIdeaId: selectedSellable.ideaId )
            
            
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let spd = PreviewDummieCode()
        let myImageURL = "https://image.spreadshirtmedia.net/image-server/v1/products/T1351A2PA5869PT17X6Y0D300128136W27495H39850/views/1,width=650,height=650,appearanceId=2,backgroundColor=2b2b2b,crop=detail,modelId=3896/totenkopf-und-pistolen-fuer-chronisch-genervte-menschen-die-einfach-nur-ihre-ruhe-haben-wollen-von-dem-designer-shokstar-geildesignt.jpg"
        
        ProductDetailView(selectedSellable: spd.sellablePD, productImages: [ProductImageViewModel(id: UUID(), imageURL: myImageURL, imageType: "MODEL")] )
            .environmentObject(SellablesListViewModel())
            .environmentObject(ProductDetailViewModel())
    }
}
