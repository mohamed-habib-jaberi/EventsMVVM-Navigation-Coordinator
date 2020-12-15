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
    
    @IBOutlet weak var timeRemainingStackView: TimeRemainingStackView!{
        didSet{
            timeRemainingStackView.setup()
        }
    }
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var viewModel: EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            
            guard let self = self,
                let timeRemainingViewModel = self.viewModel.timeRemainingViewModel
                     else { return  }
            
            self.backgroundImageView.image = self.viewModel.image
            self.timeRemainingStackView.update(with: timeRemainingViewModel)
            // time remaining labels, event name and date label
        }
        
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "pencil"), style: .plain, target: viewModel, action: #selector(viewModel.editButtonTapped))
        
        viewModel.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear() 
    }
}
