//
//  Image.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 10.03.23.
//

import Foundation
import SwiftUI

// Eine Erweiterungsmethode für das SwiftUI-Image-View, die eine asynchrone Bildanfrage startet.
extension Image {
    
    // asyncData ist eine Methode, die ein AsyncImage-Objekt zurückgibt.
    // imageUrl ist der Pfad zur Bild-URL als String.
    func asyncData(imageUrl: String) -> AsyncImage {
        
        // Ein AsyncImage-Objekt wird erstellt und zurückgegeben, indem die URL in einem ImageLoader geladen wird.
        return AsyncImage(url: URL(string: imageUrl))
    }
     
}
