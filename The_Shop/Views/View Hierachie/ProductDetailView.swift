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
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        
        
        ZStack {
            VStack {
                HeaderLogoView()
                
                Text(productVM.selectedProduct?.productName ?? "Name")
                    .font(.system(size: 30, weight: .heavy))
                    .padding(.bottom, 8)
                
                
                // productVM.selectedProduct?.productAppearanceIds[]
                
                
                // Zeige alle Produktbilder an
                let filteredImages = productVM.selectedProduct?.productImages.filter { ["DESIGN", "MODEL"].contains($0.imageType) } ?? []
                
                VStack{
                    //Spacer(minLength: 50)
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(filteredImages
                                        , id: \.self) { productImage in
                                    Image(systemName: "photo")
                                        .resizable()
                                        .asyncData(imageUrl: productImage.imageURL)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 340, height: 650 )
                                        .cornerRadius(0)
                                        .modifier(ImageModifier(contentSize: CGSize(width: 400.0, height: 0.0)))
                                     
                                    
                                    
                                }
                            } // HStack
                        } // ScrollView
                        .padding(.horizontal)
                        .onAppear{
                            
                        }
                        // Zeige andere Produktinformationen an
                        Spacer()
                        VStack {
                            
                            
                            // Falls es ein ausgewähltes Produkt gibt
                            if let product = productVM.selectedProduct {
                                let appearanceColors = product.productAppearanceIds.compactMap {
                                    // Iteriere durch die appearance Ids und erstelle ein neues Array mit den zurückgegebenen Farben
                                    appearanceId in
                                    // Wandle die appearance Id in eine Zahl um und rufe die Farben ab, die zur appearance Id gehören. Falls die Umwandlung fehlschlägt, verwende die Zahl 0 als Standardwert.
                                    productVM.getColorForProductAppearanceId(Int(appearanceId) ?? 0)
                                }
                                
                                // Zeige das View mit den Farben an
                                VStack {
                                    
                                    AppearanceColorsView(appearanceIds: productVM.selectedProduct?.productAppearanceIds.compactMap{ Int($0)} ?? [1] )
                                        .environmentObject(productVM)
                                    
                                } // VStack
                                
                            }
                            // Wenn kein Produkt ausgewählt wurde
                            else {
                                // Zeige den Text "No product selected" an
                                Text("No product selected") // Zeige den Text "No product selected" an
                            }
                            
                            
                            // Text(productVM.selectedProduct?.productAppearanceIds[0] ?? "Farbe" )
                            
                            Text(productVM.selectedProduct?.productDescription ?? "Beschreibung")
                                .foregroundColor(.white)
                                .padding()
                            
                            Text("\(productVM.selectedProduct?.productFormattedPrice ?? "") ")
                                .foregroundColor(.white)
                                .padding()
                                .onAppear{
                                    print("CONSTANTS: \(Constants.PAGE_COUNT)")
                                }
                            Spacer()
                            
                            
                        } // VStack
                        
                    } // VStack
                    
                } // VStack
                .background(Color.ambientGray)
                .cornerRadius(40)
                
                
            } // VStack
            .task{
                do {
                    try productVM.fetchProduct(sellableId: selectedSellable.sellableId, productAppearanceIds: selectedSellable.appearanceIds[0], productIdeaId: selectedSellable.ideaId)
                } catch let error {
                    print("Error fetching product: \(error.localizedDescription)")
                    // handle error as needed
                }
                
                
            }
        } // ZStack
    
        
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
