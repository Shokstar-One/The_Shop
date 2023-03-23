//
//  ProductDetailView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 16.03.23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var productVM: ProductDetailViewModel
    let sellableVM: SellablesListViewModel
    @State var productImageVM = ProductImageViewModel(productImage: ProductImage.init(url: String(), type: String()))
    
    
    var body: some View {
        VStack {
            if let product = productVM.selectedProduct {
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
                        
                        Text(product.productName)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                        
                        Text(product.productDescription)
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
                        //                            }
                        //                            .padding(.horizontal, 20)
                        //                            .padding(.vertical, 5)
                        //                        }
                        
                        Spacer()
                    }
                }
            } else if productVM.error != nil {
                Text("Nix geht!")
            } else {
                ProgressView()
            }
        }
        .navigationBarTitle(Text("Product Detail"))
        .onAppear {
            productVM.fetchProduct(sellableId: "\(sellableVM.selectedSellable?.sellableId)", productAppearanceIds: "\(productVM.selectedSellable?.appearanceIds)", productIdeaId: "\(productVM.selectedSellable?.ideaId)")
            
            //print( productVM.fetchProduct(sellableId: "\(sellableVM.selectedSellable?.sellableId)", productAppearanceIds: "\(productVM.selectedSellable?.appearanceIds)", productIdeaId: "\(productVM.selectedSellable?.ideaId)"))
            
            print ("Comet: \(String(describing: sellableVM.selectedSellable?.name))")
            
        }
    }
}



struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(sellableVM: SellablesListViewModel())
            .environmentObject(SellablesListViewModel())
            .environmentObject(ProductDetailViewModel())
    }
}
