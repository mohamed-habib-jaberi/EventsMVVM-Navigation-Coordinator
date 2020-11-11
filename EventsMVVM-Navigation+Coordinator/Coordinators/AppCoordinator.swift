//
//  AppCoordinator.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

protocol Coordinator: class  {
    
    var childCoordinators: [Coordinator] {get}
    func start()
    
}
final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        
        childCoordinators.append(eventListCoordinator)
        eventListCoordinator.start()
        
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
    
}
