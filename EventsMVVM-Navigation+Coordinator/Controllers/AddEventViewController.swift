//
//  AddEventViewController.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {

    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisapear()
        
    }
    
    deinit {
        print("deinit from Add Event View Controller ")
    }
}
