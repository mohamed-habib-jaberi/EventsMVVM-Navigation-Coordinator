//
//  AddEventCoordinator.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

final class AddEventCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private var modalNavigationController: UINavigationController?
    private var completion: (UIImage) -> Void = {_ in }
    
    var parentCoordinator: (EventUpdatingCoordinator & Coordinator)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.modalNavigationController = UINavigationController()
        
        //Create add event view controller
        //Create add event view model
        //present modally controller using navigation controller
        
        let addEventViewController: AddEventViewController = .instantiate()
        //present navigation bar in addEventViewController
        modalNavigationController?.setViewControllers([addEventViewController], animated: false)
        let addEventViewModel = AddEventViewModel(cellBuilder: EventCellBuilder())
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        
        if let modalNavigationController = modalNavigationController {
            navigationController.present(modalNavigationController, animated: true, completion: nil)
        }
        
    }
    
    func didFinish()  {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishSaveEvent()  {
        parentCoordinator?.onUpdateEvent()
        navigationController.dismiss(animated: true, completion: nil)
        
    }
    
    func showImagePicker( completion: @escaping (UIImage) -> Void) {
        
        print("show image picker ")
        
        guard let modalNavigationController = modalNavigationController else { return  }
        
        self.completion = completion
        
              let imagePickerCoordinator = ImagePickerCoordinator(navigationController: modalNavigationController)
        imagePickerCoordinator.onFinishPicking = { image in
            self.completion(image)
            self.modalNavigationController?.dismiss(animated: true, completion: nil)
        }
        imagePickerCoordinator.parentCoordinator = self
              childCoordinators.append(imagePickerCoordinator)
              imagePickerCoordinator.start()
    }
    
    //tell view modal that we have done and it can update our view
//    func didFinishPicking( _ image: UIImage) {
//        print("did finish picking")
//        completion(image)
//        modalNavigationController?.dismiss(animated: true, completion: nil)
//    }
  
    
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
