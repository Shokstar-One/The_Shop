//
//  OnBoardingView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 28.03.23.
//

import SwiftUI

struct OnBoardingView: View {
    
    
    // Zustandsvariable zum Anzeigen der Parent View
    @State var isShowingParentView : Bool = false
       
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    // Header-Logo
                    HeaderLogoView()
                        .padding(.top, 48)
                    
                    VStack{
                        // Bild des Onboarding-Titels
                        Image("iv_header_txt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        // Shirt-Bild, das durch ein Maskenbild sichtbar gemacht wird
                        GeometryReader { geometry in
                            Image("iv_shirt_pv")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .foregroundColor(Color.red)
                                .scaleEffect(1.1)
                                .offset(x: 90, y: 80)
                            
                                .mask(
                                    Image("iv_shirt_ph")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        .foregroundColor(Color.red)
                                    
                                )
                            
                        } // GeometryReader
                        .position(x:200, y:250)
                        .padding(.top, 16)
                        .overlay{
                            // Rote Spritzer und Fronttext über dem Shirt
                            Image("iv_splatter_red")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .position(x:200, y:600 )
                                .overlay{
                                    Image("iv_front_txt")
                                        .position(x: 210, y: 470)
                                        .scaleEffect(1.3)
                                }
                        }
                        
                    } // VStack für Bilder
                    
                    // Button für Navigation zur Parent View mit Overlay
                    .overlay{
                        Button(action: {
                            self.isShowingParentView = true
                            print("Button geklickt für die NAVI")
                        }) {
                            Image("iv_cta_green")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(2.3)
                                .frame(width: 100, height: 50) // optional: Größe des Buttons festlegen
                        }
                        .position(x: 300, y: 740)
                        
                    } // Overlay
                    
                    // Navigationslink zur Parent View
                    NavigationLink("", destination: SellablesListView(), isActive: self.$isShowingParentView)
                    EmptyView()
                    
                } // VStack
                
            } // ZStack
           
            // Ignoriert die sichere Bereich des Geräts
            .ignoresSafeArea()
            
            // Hintergrundfarbe des Onboarding-Views
            .background(Color.black)
            
   
        }

    }
    
}


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
