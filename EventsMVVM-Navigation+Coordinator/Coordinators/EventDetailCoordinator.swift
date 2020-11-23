//
//  EventDetailCoordinator.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 22/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit
import CoreData


final class EventDetailCoordinator: Coordinator {
   private(set) var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController
    private var eventID: NSManagedObjectID
    
    var parentCoordinator: EventListCoordinator?
    
    init(eventID: NSManagedObjectID, navigationController: UINavigationController ) {
        self.navigationController = navigationController
        self.eventID = eventID
    }
    
    func start() {
        // create event detail view controller
        let detailViewController: EventDetailViewController = .instantiate()
         //event viewModel
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        detailViewController.viewModel = eventDetailViewModel
        //push it onto navigation controller
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func didFinish()  {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("detail coordinator deinit")
    }
    
}
