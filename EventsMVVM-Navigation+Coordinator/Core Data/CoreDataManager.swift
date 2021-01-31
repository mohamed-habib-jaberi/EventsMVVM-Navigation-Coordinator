//
//  CoreDataManager.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
  lazy var persistentContainer : NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventsMVVM-Navigation+Coordinator")
        persistentContainer.loadPersistentStores { (_, error) in
            
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc : NSManagedObjectContext {
        persistentContainer.viewContext
    }

    func save()  {
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func getAll<T: NSManagedObject>() -> [T]  {
        do {
            let fetchRequest = NSFetchRequest<T>(entityName: "\(T.self)")
            return try moc.fetch(fetchRequest)
        } catch  {
            print(error)
            return []
        }
    }
    
//    func fetchEvents() -> [Event] {
//        do {
//           let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
//            let events = try moc.fetch(fetchRequest)
//            return events
//        } catch  {
//            print(error)
//            return []
//        }
//    }
    
    func get<T: NSManagedObject>(_ id: NSManagedObjectID) -> T? {
        do {
            return try moc.existingObject(with: id) as? T
        } catch  {
            print(error)
        }
        return nil
    }
    
//    func getEvent(_ id: NSManagedObjectID) -> Event?  {
//
//        do {
//            return try moc.existingObject(with: id) as? Event
//        } catch  {
//            print(error)
//        }
//        return nil
//    }
}
