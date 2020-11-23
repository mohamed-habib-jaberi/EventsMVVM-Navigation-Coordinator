//
//  TimeRemainingViewModel.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 23/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

final class TimeRemainingViewModel {
    
    enum Mode {
        case cell
        case detail
    }
    
     let timeRemainingParts: [String]
    private let mode: Mode
    
    // Computed propriety
    var fontSize: CGFloat {
        switch mode {
        case .cell:
            return 25
        case .detail:
            return 60
        }
    }
    
    var alignment: UIStackView.Alignment {
        switch mode {
        case .cell:
            return .trailing
        case .detail:
            return .center
        }
    }
    
    init(timeRemainingParts: [String], mode: Mode) {
        self.timeRemainingParts = timeRemainingParts
        self.mode = mode
    }
}
