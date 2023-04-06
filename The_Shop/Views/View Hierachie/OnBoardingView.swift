//
//  OnBoardingView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 28.03.23.
//

import SwiftUI

struct OnBoardingView: View {
    
    // Zustandsvariable zum Anzeigen der Parent View
    @State private var isShowingParentView : Bool = false
    @State private var isAnimating = false
    @State private var isAnimatingImage = false
    @State private var isHeaderAnimated = false
    
    @State private var shadowRadius: CGFloat = 1
    @State private var shadowYOffset: CGFloat = -15
    @State private var shadowOpacity: CGFloat = 0.5
    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack{
                    // Header-Logo
                    HeaderLogoView()
                        .offset(y: isHeaderAnimated ? 0 : -UIScreen.main.bounds.height)
                        .animation(.interpolatingSpring(mass: 3, stiffness: 75, damping: 100, initialVelocity: 0))
                        .onAppear {
                            isHeaderAnimated = true
                        }
                        .padding(.top, 48)
                    
                    
                    // Bild des Onboarding-Titels
                    Image("iv_header_txt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(y: isHeaderAnimated ? 0 : -UIScreen.main.bounds.height)
                        .animation(.interpolatingSpring(mass: 5, stiffness: 75, damping: 100, initialVelocity: 0))
                        .onAppear {
                            withAnimation(Animation.easeOut(duration: 2.5)) {
                                isHeaderAnimated = true
                            }
                            
                        }
                    
                    
                    VStack{
                        
                        // Shirt-Bild, das durch ein Maskenbild sichtbar gemacht wird
                        GeometryReader { geometry in
                            
                            Image("iv_shirt_pv")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .foregroundColor(Color.red)
                                .scaleEffect(1.1)
                                .offset(x: isAnimatingImage ? 0 : -geometry.size.width, y: 80)
                                .opacity(isAnimatingImage ? 1 : 0)
                                .onAppear {
                                    withAnimation(Animation.easeOut(duration: 2.5)) {
                                        isAnimatingImage = true
                                    }
                                }
                            
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
                            print("Button: Hols Dir! wurde geklickt. ")
                        }) {
                            Image("iv_cta_green")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(isAnimating ? 2.8 : 2.2) // vergrößern bei der Animation
                                .frame(width: 100, height: 50)
                                .rotationEffect(isAnimating ? Angle(degrees: -15) : Angle(degrees: 0)) // Rotation
                                .shadow(color: Color.black.opacity(shadowOpacity), radius: shadowRadius, x: 0, y: shadowYOffset)
                                .onAppear {
                                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                                        shadowRadius = 5
                                        shadowYOffset = -80
                                        shadowOpacity = 0.15
                                    }
                                    isAnimating = true
                                }
                            
                        }
                        .position(x: 300, y: 680)
                        .animation(
                            Animation.easeInOut(duration: 2.5)
                                .repeatForever(autoreverses: true) // Wiederholung und Rückwärtsbewegung
                        )
                        .onAppear() {
                            self.isAnimating = true
                        }
                        
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
