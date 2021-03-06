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
    func updateEvent(event: Event, name: String, date: Date, image: UIImage)  {
        event.setValue(name, forKey: "name")
        
        let resizeImage = image.someAspectRatio(newHeight: 250)
        
        let imageData = resizeImage.jpegData(compressionQuality: 0.5)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    func saveEvent(name: String, date: Date, image: UIImage)  {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        
        let resizeImage = image.someAspectRatio(newHeight: 250)
        
        let imageData = resizeImage.jpegData(compressionQuality: 0.5)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
           let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        } catch  {
            print(error)
            return []
        }
    }
    
    func getEvent(_ id: NSManagedObjectID) -> Event?  {
        
        do {
            return try moc.existingObject(with: id) as? Event
        } catch  {
            print(error)
        }
        return nil
    }
}
