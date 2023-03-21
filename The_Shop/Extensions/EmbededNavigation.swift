//
//  EmbededNavigation.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 21.03.23.
//

import Foundation
import SwiftUI


//
extension View {
    
    // Funktion, die eine Ansicht in einer NavigationView einbettet
    func embedInNavigationView() -> some View {
        // NavigationView mit der aktuellen Ansicht als Inhalt zurückgeben
        NavigationView { self }
    }
    
}

