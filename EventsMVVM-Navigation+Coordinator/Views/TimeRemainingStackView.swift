//
//  TimeRemainingStackView.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 23/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

final class TimeRemainingStackView: UIStackView{
    
    private let timeRemainingLabes = [UILabel(), UILabel(), UILabel(), UILabel()]
    
    func setup()  {
        timeRemainingLabes.forEach {
            addArrangedSubview($0)
        }
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func update(with viewModel: TimeRemainingViewModel)  {
        
        timeRemainingLabes.forEach {
            $0.text = ""
            $0.font = .systemFont(ofSize: viewModel.fontSize, weight: .medium)
            $0.textColor = .white
        }
        
        viewModel.timeRemainingParts.enumerated().forEach{
            timeRemainingLabes[$0.offset].text = $0.element
        }
        
        alignment = viewModel.alignment
    }
    
    
}
