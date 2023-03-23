//
//  ProductDetailView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 16.03.23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var productVM: ProductDetailViewModel
    let sellableVM: SellableViewModel
    @State var productImageVM = ProductImageViewModel(productImage: ProductImage.init(url: String(), type: String()))

    
    var body: some View {
        VStack {
            if let product = productVM {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
//                        RemoteImage(url: product.images.first?.url ?? "")
//                            .aspectRatio(contentMode: .fit)
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 20)
//
//                        Image(systemName: "photo")
//                            .asyncData(imageUrl: productImageVM.imageURL)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 250, height: 250)
//                            .cornerRadius(25)
                        
                        Text(product.selectedProduct?.productName ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                        
                        Text(product.selectedProduct?.productDescription ?? "")
                            .font(.body)
                            .padding(.horizontal, 20)
                        
//                        ForEach(product.productSizeIds, id: \.self) { size in
//                            HStack {
//                                Text(size.)
//                                    .font(.body)
//
//                                Spacer()
//
//                                Text(productVM.selectedProduct?.productFormattedPrice(for: size))
//                                    .font(.body)
//                            } // HStack
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 5)
//                        }
                        
                        Spacer()
                    } // VStack
                } // ScrollView
            } else if productVM.error != nil {
              Text("Nix geht!")
            } else {
                ProgressView()
            }
        } // VStack
        .navigationBarTitle(Text("Product Detail"))
        .onAppear {
            
            //print("me test: \( sellableVM.sellableId)")
            
            productVM.fetchProduct(sellableId: sellableVM.sellableId, productAppearanceIds: sellableVM.appearanceIds[0], productIdeaId: sellableVM.ideaId)
            
            print("Shokstar TEST: \(sellableVM.description)")
            
            print ("TEST Shirt NAME: \(String(describing: sellableVM.name))")
            
        }
    }
}



//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView( sellableVM: Se)
//            .environmentObject(SellablesListViewModel())
//            .environmentObject(ProductDetailViewModel())
//    }
//}
