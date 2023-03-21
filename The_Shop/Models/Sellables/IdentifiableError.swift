//
//  IdentifiableError.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 10.03.23.
//

import Foundation

// Eine Struktur, die Identifiable und LocalizedError konform ist
struct IdentifiableError: Identifiable, LocalizedError {
    var id = UUID()
    var message: String
    
    // Eine berechnete Eigenschaft, die eine lokalisierte Beschreibung des Fehlers zurückgibt
    var errorDescription: String? {
        return NSLocalizedString(message, comment: "FEHLER!!!! errorDescription")
    }
}

// Eine Erweiterung der IdentifiableError-Struktur, die eine lokale Beschreibung des Fehlers zurückgibt
extension IdentifiableError {
    var localizedDescription: String {
        return errorDescription ?? "Unbekannter Fehler aufgetreten."
    }
}



