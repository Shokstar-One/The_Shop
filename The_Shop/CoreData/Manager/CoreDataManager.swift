//
//  CoreDataManager.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 12.04.23.
//

import Foundation
import CoreData
import SwiftUI

// Eine Klasse zur Verwaltung des Core Data-Stacks und des Zugriffs auf den NSManagedObjectContext
class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    // Initialisiert die NSPersistentContainer und lädt die persistenten Stores
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "ShopAppModel") // Ersetze "YourProjectModel" durch den Namen deines Datenmodells
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Fehler beim Initialisieren von Core Data: \(error)") // Hier wird ein Fatal Error ausgelöst, falls beim Laden der Stores ein Fehler auftritt.
            }
        }
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0]) // Gibt den Pfad zum Documents-Verzeichnis auf der Konsole aus
    }
    
    // Gibt den Standard-NSManagedObjectContext zurück, der für die Verwaltung der Daten verwendet wird
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
}
