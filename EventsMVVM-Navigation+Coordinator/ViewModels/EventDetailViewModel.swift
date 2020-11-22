//
//  EventDetailViewModel.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 22/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class EventDetailViewModel {
    
    private let eventID: NSManagedObjectID
    private let coreDataManager: CoreDataManager
    private var event: Event?
    
    var onUpdate = {}
    
    var image: UIImage? {
        guard let imageData = event?.image else { return nil }
        return UIImage(data: imageData)
    }
    
    init(eventID: NSManagedObjectID, coreDataManager: CoreDataManager = .shared) {
        self.coreDataManager = coreDataManager
        self.eventID = eventID
    }
    
    func viewDidLoad() {
       event = coreDataManager.getEvent(eventID)
        onUpdate()
    }
}
