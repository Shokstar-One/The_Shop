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
        VStack {
            // Hintergrundrechteck mit Schatten
            Rectangle()
                .fill(Color.black)
                .frame(height: 100)
                .shadow(color: Color.gray.opacity(1), radius: 50, x: 0, y: -170)
               
                .overlay{
                    
                    // Das Bild
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .padding()
                }
              
        }
    }
}
    struct HeaderLogoView_Previews: PreviewProvider {
        static var previews: some View {
            HeaderLogoView()
        }
    }

