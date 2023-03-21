//
//  AsyncImage.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 14.03.23.
//

import Foundation
import SwiftUI

// Eine View zur Darstellung eines asynchronen Bilds, das von einer URL geladen wird
struct AsyncImage: View {
    // Ein ImageLoader, der das Laden des Bildes asynchron durchführt
    @StateObject private var loader: ImageLoader
    
    // Initialisierung mit einer URL, von der das Bild geladen werden soll
    init(url: URL?) {
        // Erstellung des ImageLoaders
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    // Die Body-Funktion, die die View darstellt
    var body: some View {
        // Wenn das Bild bereits geladen wurde, wird es angezeigt
        if let image = loader.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        }
        // Ansonsten wird ein Fortschrittsindikator angezeigt, während das Bild geladen wird
        else {
            ProgressView()
        }
    }
}

