//
//  AddEventViewModel.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

final class AddEventViewModel {
    
    var coordinator: AddEventCoordinator?
    
    func viewDidDisapear()  {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("deinit from Add Event View Model ")
    }
}
