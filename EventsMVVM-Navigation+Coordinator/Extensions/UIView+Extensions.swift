//
//  UIView+Extensions.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 21/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

enum Edge {
    case left
    case right
    case top
    case bottom
}

extension UIView {
    
    func pintToSuberviewEdges(_ edges: [Edge] = [.top, .bottom, .right, .left], constant: CGFloat = 0)  {
        guard let superview = superview else { return  }
        
        edges.forEach{
            switch $0 {
                
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant ).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant ).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant ).isActive = true
           
            }
        }
    }
    
}
