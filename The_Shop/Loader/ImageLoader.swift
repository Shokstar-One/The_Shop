//
//  ImageLoader.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 14.03.23.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    // Beobachtbare Variable für das geladene Bild
    @Published var image: UIImage?
    
    // Konstruktor, der eine URL für das zu ladende Bild erwartet
    init(url: URL?) {
        // Wenn keine URL gegeben ist, den Konstruktor verlassen
        guard let url = url else { return }
        
        // Mit der URL eine Datenanfrage erstellen
        URLSession.shared.dataTask(with: url) { data, _, error in
            // Wenn ein Fehler auftritt oder keine Daten empfangen werden können, den Code verlassen
            guard let data = data, error == nil else { return }
            
            // Auf dem Hauptthread das Bild setzen
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()  // Die Anfrage starten
    }
}

