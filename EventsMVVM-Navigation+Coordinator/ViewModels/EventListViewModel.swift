//
//  EventListViewModel.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

final class EventListViewModel {
    
    enum Cell {
        case event(EventCellViewModel)
    }
    private(set) var cells: [Cell] = []
    
    var onUpdate = {}
    
    let title = "Event"
    var coordinator: EventListCoordinator?
    
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad()  {
      reload()
    }
    
    func reload()  {
        let event = coreDataManager.fetchEvents()
              
              cells = event.map {
                  .event(EventCellViewModel(event: $0))
              }
            
              onUpdate()
    }
    
    func tappedAddEvent()  {
        
        print("tapped Add Event")
        
        coordinator?.startAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
}
