//
//  BaseModel.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 12.04.23.
//

import Foundation
import CoreData

protocol CoreDataModel: NSManagedObject {
    static var entityName: String { get }
}

extension CoreDataModel {
    // Rückgabe des viewContexts von CoreDataManager
    static var viewContext: NSManagedObjectContext {
        return CoreDataManager.shared.viewContext
    }
    
    // Abrufen aller Objekte vom Typ T
    static func fetchAll<T: CoreDataModel>() -> [T] {
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest(entityName: Self.entityName)
        
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            print("Konnte \(Self.entityName)-Objekte nicht abrufen: \(error)")
            return []
        }
    }
    
    // Abrufen des Objekts vom Typ T mit einer bestimmten ID
    static func fetchById<T: CoreDataModel>(id: NSManagedObjectID) -> T? {
        do {
            return try viewContext.existingObject(with: id) as? T
        } catch {
            print("Konnte \(Self.entityName)-Objekt mit ID \(id) nicht abrufen: \(error)")
            return nil
        }
    }
    
    // Speichern des Objekts
    func save() throws {
        do {
            try Self.viewContext.save()
        } catch {
            throw error
        }
    }
    
    // Löschen des Objekts
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}

