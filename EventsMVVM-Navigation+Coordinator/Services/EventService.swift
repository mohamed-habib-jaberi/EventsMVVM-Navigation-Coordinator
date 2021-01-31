//
//  EventService.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 28/01/2021.
//  Copyright © 2021 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/*
 EventServiceProtocol can help us to write unite test by create mock and test ViewModel
 */

protocol EventServiceProtocol {
    func perform(_ action: EventService.EventAction, _ data: EventService.EventInputData)
    func getEvent(_ id: NSManagedObjectID) -> Event?
    func getEvents() -> [ Event]
}

final class EventService: EventServiceProtocol {
    struct EventInputData {
        let name: String
        let date: Date
        let image: UIImage
    }
    enum EventAction {
        case add
        case update (Event)
    }
    
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = .shared) {
        self.coreDataManager = coreDataManager
    }
    
    func perform(_ action: EventAction, _ data: EventInputData) {
        var event: Event?
        switch action {
        case .add:
            event = Event(context: coreDataManager.moc)
        case .update(let eventToUpdate):
            event = eventToUpdate
        }
        event?.setValue(data.name, forKey: "name")
        
        let resizeImage = data.image.someAspectRatio(newHeight: 250)
        
        let imageData = resizeImage.jpegData(compressionQuality: 0.5)
        event?.setValue(imageData, forKey: "image")
        event?.setValue(data.date, forKey: "date")
        
        coreDataManager.save()
    }
    
    func getEvent(_ id: NSManagedObjectID) -> Event? {
        return coreDataManager.get(id)
    }
    
    func getEvents() -> [ Event] {
        return coreDataManager.getAll()
    }
    
}
