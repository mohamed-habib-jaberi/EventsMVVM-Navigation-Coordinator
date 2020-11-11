//
//  EventListViewModel.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

final class EventListViewModel {
    
    let title = "Event"
    var coordinator: EventListCoordinator?
    
    func tappedAddEvent()  {
        
        print("tapped Add Event")
        
        coordinator?.startAddEvent()
    }
}
