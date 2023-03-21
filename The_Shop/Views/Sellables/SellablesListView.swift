//
//  SellablesListView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 05.03.23.
//

import Foundation
import SwiftUI
import Combine
import UIKit

//zum pushen
struct SellablesListView: View {
    // Zugriff auf den SellablesListViewModel, der das Array der verkaufbaren Produkte hält
    @EnvironmentObject var sellableVM: SellablesListViewModel
    // Zugriff auf den ProductDetailViewModel, der das selektierte Produkt hält
    @EnvironmentObject var productVM: ProductDetailViewModel
    
    // Zustände für die Animation des Buttons
    @State private var isAnimated = false
    @State private var buttonOpacity: Double = 0
    @State private var yOffset: CGFloat = -100
    @State private var yOffsetTwo: CGFloat = 100
    

    
    var body: some View {
        // Die Hauptansicht, in der alles enthalten ist
        NavigationView {
            
         
            ZStack {
                VStack {
                    // HeaderLogoView zeigt das Logo der App
                    HeaderLogoView()
                        .padding(.horizontal, .pi)
                        .offset(y: isAnimated ? 0 : -UIScreen.main.bounds.height)
                        .animation(.interpolatingSpring(mass: 0.5, stiffness: 75, damping: 100, initialVelocity: 0))
                        .onAppear {
                            isAnimated = true
                        }
                    // Liste aller verkaufbaren Produkte --- SellableDetailView(sellableVM: sellableVM))
                    List(sellableVM.theSellablesListFromVM, id: \.ideaId) { sellableVM in
                        NavigationLink(destination: ProductDetailView().environmentObject(productVM)) {
                            SellableRowView(sellableVM: sellableVM)
                                .onTapGesture {
                                    productVM.selectedSellable = sellableVM.sellable
                                       }
                        }
                        
                    }
                    .listStyle(.plain)
                    .navigationBarTitleDisplayMode(.inline)
                
                } //VStack HEADER
                
                
                // Ein rechteckiges Overlay mit einer Animation und einem Button
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .red, .clear]),
                            startPoint: .topLeading,
                            endPoint: .bottom
                        )
                        .opacity(1)
                    )
                    .frame(height: 100)
                    .blur(radius: 0)
                    .rotationEffect(.degrees(-4))
                    .opacity(isAnimated ? 1 : 0)
                    .offset(x: isAnimated ? 0 : -UIScreen.main.bounds.width, y: 0)
                    .animation(.easeInOut(duration: 1.0))
                    .onAppear {
                        isAnimated = true
                    }
                    .overlay {
                        // Button, der beim Klicken die Funktion "fetchSellables" des SellablesListViewModel aufruft
                        Button(action: {
                            sellableVM.fetchSellables()
                            
                            print("Button wurde geklickt!")
                        }, label: {
                            
                            Text("Designs!")
                                .shadow(color: .white, radius: 4, x: 1, y: 3)
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(Color(red: 58/255, green: 0/255, blue: 0/255))
                            //.foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0/255, green: 255/255, blue: 255/255))
                            //.background(.red)
                                .cornerRadius(25)
                                .shadow(color: Color.black, radius: 3, x: 0, y: 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(LinearGradient(
                                            gradient: Gradient(colors: [Color(red: 58/255, green: 255/255, blue: 255/255), .clear, .clear]),
                                            startPoint: .bottomLeading,
                                            endPoint: .top
                                        ), lineWidth:6 )
                                )
                        })// BUTTON
                        .overlay(
                            // Ein Rahmen um den Button, der einen Verlaufseffekt aufweist
                            RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color(red: 191/255, green: 255/255, blue: 255/255), .clear, .clear]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomLeading
                                    ),
                                    lineWidth: 8
                                )
                                .offset(y:2)
                        )
                        // Animation des Buttons beim Erscheinen
                        .opacity(buttonOpacity)
                        .offset(x: 0, y: isAnimated ? 0 : UIScreen.main.bounds.height)
                        .animation(.interpolatingSpring(mass: 0.5, stiffness: 75, damping: 100, initialVelocity: 0))
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.5).delay(0.75)) {
                                buttonOpacity = 1.0
                                isAnimated = true
                            }
                        }//BUTTON ENDE
                        
                    }
                    .offset(y: 350)
               
                
            }
        }
        // Beim Erscheinen der Ansicht sollen die verkaufbaren Produkte aus dem Netzwerk abgerufen werden
        .onAppear {
            sellableVM.fetchSellables()
        }
        // Alert, der angezeigt wird, wenn ein Fehler auftritt
        .alert(item: $sellableVM.error) { error in
            Alert(title: Text("Error"), message: Text((error.localizedDescription)), dismissButton: .default(Text("OK")))
        }
        
        
    }
    
}


struct SellablesListView_Previews: PreviewProvider {
    static var previews: some View {
        
        SellablesListView()
            .environmentObject(SellablesListViewModel())
            .environmentObject(ProductDetailViewModel())
    }
}

