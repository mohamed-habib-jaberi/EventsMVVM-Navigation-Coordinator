//
//  EditEventCoordinator.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 15/12/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

protocol EventUpdatingCoordinator {
    func onUpdateEvent()
}

final class EditEventCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private let event: Event
    
    private var completion: (UIImage) -> Void = {_ in }
    
    var parentCoordinator: (EventUpdatingCoordinator & Coordinator)?
    
    init(event: Event,
         navigationController: UINavigationController
    ) {
        self.event = event  
        self.navigationController = navigationController
    }
    
    func start() {
        
        let editEventViewController: EditEventViewController = .instantiate()
        let editEventViewModel = EditEventViewModel(event: event, cellBuilder: EventCellBuilder())
        editEventViewModel.coordinator = self
        editEventViewController.viewModel = editEventViewModel
        
        navigationController.pushViewController(editEventViewController, animated: true)
        
    }
    
    func didFinish()  {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishUpdateEvent()  {
        parentCoordinator?.onUpdateEvent()
        navigationController.popViewController(animated: true)
    }
    
    func showImagePicker( completion: @escaping (UIImage) -> Void) {
        
        print("show image picker ")
        
        self.completion = completion
        
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: navigationController)
        imagePickerCoordinator.parentCoordinator = self
        imagePickerCoordinator.onFinishPicking = { image in
            completion(image)
            self.navigationController.dismiss(animated: true, completion: nil)
        }
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
    }
    
    //tell view modal that we have done and it can update our view
   
    
    
    func childDidFinish(_ childCoordinator: Coordinator)  {
        
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return  childCoordinator === coordinator
        })  {
            childCoordinators.remove(at: index)
        }
    }
    
    deinit {
        print("deinit from add event coordinator")
    }
}
