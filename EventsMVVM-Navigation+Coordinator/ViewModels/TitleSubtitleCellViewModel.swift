//
//  TitleSubtitleCellViewModel.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 12/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

final class TitleSubtitleCellViewModel {
    
    enum CellType {
        case text
        case date
        case image
    }
    
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    let type: CellType
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    private(set) var onCellUpdate : () -> Void = {}
    
    init(title: String, subtitle: String, placeholder: String, type: CellType, onCellUpdate: @escaping () -> Void ) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.type = type
        self.onCellUpdate = onCellUpdate
    }
    
    func update(_ subtitle: String)  {
        self.subtitle = subtitle
    }
    
    func update(_ date: Date)  {
        let dateString = dateFormatter.string(from: date)
        self.subtitle = dateString
        // reload cell
        onCellUpdate()
    }
}
