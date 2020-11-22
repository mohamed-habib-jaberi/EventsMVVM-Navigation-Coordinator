//
//  EventDetailViewController.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 22/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

final class EventDetailViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var viewModel: EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            self?.backgroundImageView.image = self?.viewModel.image
            // time remaining labels, event name and date label
        }
        
        viewModel.viewDidLoad()
    }
}
