//
//  EventCellBuilder.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 14/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

struct EventCellBuilder {
    func makeTitleSubtitleCellViewModel(
        _ type: TitleSubtitleCellViewModel.CellType,
        onCellUpdate: (() -> Void)? = nil
    ) -> TitleSubtitleCellViewModel {
        
        switch type {
        case .text:
            return TitleSubtitleCellViewModel(
                title: "Name", subtitle: "",
                placeholder: "Add a name",
                type: .text,
                onCellUpdate: onCellUpdate
            )
        case .date:
            return  TitleSubtitleCellViewModel(
                title: "Date",
                subtitle: "",
                placeholder: "Select a date",
                type: .date,
                onCellUpdate: onCellUpdate
            )
        case .image:
          return  TitleSubtitleCellViewModel(
            title: "Background",
            subtitle: "",
            placeholder: "",
            type: .image,
            onCellUpdate:onCellUpdate
            )
        }
    }
}
