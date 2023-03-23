//
//  HeaderLogoView.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 17.03.23.
//

import Foundation
import SwiftUI

struct HeaderLogoView: View {
    
    
    var body: some View {
        VStack(alignment: .trailing) {
            // Hintergrundrechteck mit Schatten
            //            Rectangle()
            //                .fill(Color.black)
            //                .frame(height: 40)
            //                .shadow(color: Color.gray.opacity(1), radius: 50, x: 0, y: -70)
            //
            //                .overlay{
            //
            //                    Image("iv_underlay_logo")
            //                        .resizable()
            //                        .aspectRatio(contentMode: .fill)
            //                        .frame(height: 40, alignment: .trailing)
            //
            //                    //Das Bild
            //                    VStack {
            //                        Image("iv_small_logo")
            //                            .resizable()
            //                            .aspectRatio(contentMode: .fit)
            //                            .frame(height: 40)
            //                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            //                            .padding(.horizontal)
            //                            .offset(y:-4)
            //
            //
            //                    } // VStack
            //                    .padding(.horizontal)
            
            Image("iv_header_clean2")
                .resizable()
                .aspectRatio(contentMode: .fit)

                .overlay{
                    
                    HStack {
                        Image("iv_small_logo")
                            .position(x: 75, y: 28)
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            
                        
                        Image(systemName: "cart")
                            .foregroundColor(.white)
                            .padding(.trailing, 10)
                          
                    }
                    
                        
                }
                .shadow(color: Color.gray.opacity(1), radius: 50, x: 0, y: -45)
            
            
        }
        
    } // VStack
}

struct HeaderLogoView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderLogoView()
    }
}

