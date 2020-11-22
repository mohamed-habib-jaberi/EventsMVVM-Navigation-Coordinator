//
//  Date+Extensions.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 22/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

extension Date {
    
    func timeRemaining(until endDate: Date) -> String? {
        
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year, .month, .weekOfMonth, .day]
        dateComponentsFormatter.unitsStyle = .full
        return dateComponentsFormatter.string(from: self, to: endDate)
    }
}
