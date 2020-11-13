//
//  AddEventViewModel.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 11/11/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

final class AddEventViewModel {
    
    let title = "Add"
    
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
       
    }
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    var coordinator: AddEventCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name", type: .text, onCellUpdate: {})
            ),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date", type: .date, onCellUpdate: { [weak self] in
                
                self?.onUpdate()
            })
            ),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Background", subtitle: "", placeholder: "", type: .image, onCellUpdate: { [weak self] in
                
                self?.onUpdate()
            })
            )
        ]
        onUpdate()
    }
    
    func viewDidDisapear()  {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("deinit from Add Event View Model ")
    }
    
    func numberOfRows() -> Int  {
        return cells.count
    }
    func cell(for indexPath: IndexPath) -> Cell  {
        return cells[indexPath.row]
    }
    
    func tappedDone()  {
        //extract info from cell view models and save in core data
        //tell coordinator to dismiss
        print("tapped done")
        
    }
    
    func updateCell(indexpath: IndexPath, subtitle: String){
        
        switch cells[indexpath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
     
        }
    }
}



