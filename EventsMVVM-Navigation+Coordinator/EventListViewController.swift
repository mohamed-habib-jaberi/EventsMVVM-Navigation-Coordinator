//
//  EventListViewController.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {

    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     setupViews()
        
    }
    private func setupViews(){
        let plusimage = UIImage(systemName: "plus.circle.fill")
             let barButtonItem = UIBarButtonItem(image: plusimage, style: .plain, target: self, action: #selector(tappedRightBarButton))
             barButtonItem.tintColor = .primary
             navigationItem.rightBarButtonItem = barButtonItem
             navigationItem.title = "Events"
             navigationController?.navigationBar.prefersLargeTitles = true
    }
    
   @objc private func tappedRightBarButton()  {
        print("tapped right Bar Button")
    
    }
    
}
