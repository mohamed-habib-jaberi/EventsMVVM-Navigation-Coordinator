//
//  EventListViewController.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit
import CoreData

class EventListViewController: UIViewController {
    
    var viewModel: EventListViewModel!
    
    private let coreDataManager = CoreDataManager()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        coreDataManager.saveEvent(name: "New Years", date: Date(), image: #imageLiteral(resourceName: "chris-gilbert-NxZzwsH0PHg-unsplash"))
        print(coreDataManager.fetchEvents())
    }
    private func setupViews(){
        let plusimage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusimage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton()  {
        
        viewModel.tappedAddEvent()
        
    }
    
}
