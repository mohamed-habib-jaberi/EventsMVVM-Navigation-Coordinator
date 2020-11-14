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
    
    //Add Closure to update tableView
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    var coordinator: AddEventCoordinator?
    
    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var backgroundImageCellViewModel: TitleSubtitleCellViewModel?
    private var  cellBuilder: EventCellBuilder
     private let coreDataManager: CoreDataManager
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyy"
        return dateFormatter
    }()
    
    init(cellBuilder: EventCellBuilder, coreDataManager: CoreDataManager) {
        self.cellBuilder = cellBuilder
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        setupCells()
        onUpdate()
    }
    
    func viewDidDisapear()  {
        coordinator?.didFinish()
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
    
    // Done button in toolbar
    func tappedDone()  {
        //extract info from cell view models and save in core data
        //tell coordinator to dismiss
        print("tapped done")
        
        guard let name = nameCellViewModel?.subtitle,
            let dateString = dateCellViewModel?.subtitle,
            let image = backgroundImageCellViewModel?.image,
            let date = dateFormatter.date(from: dateString)
            else { return  }
        
        coreDataManager.saveEvent(name: name, date: date, image: image)
        coordinator?.didFinishSaveEvent()
        
    }
    
    func updateCell(indexpath: IndexPath, subtitle: String){
        
        switch cells[indexpath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
            
        }
    }
    
    func didSelectRow(at indexPath: IndexPath)  {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            guard  titleSubtitleCellViewModel.type == .image else { return  }
            
            coordinator?.showImagePicker { image in
                // do something
                titleSubtitleCellViewModel.update(image)
            }
        }
    }
}


private extension AddEventViewModel {
    
    func setupCells()  {
        
        nameCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.text)
        dateCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.date) { [weak self] in
            self?.onUpdate()
        }
        backgroundImageCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.image) { [weak self] in
            self?.onUpdate()
        }
        
        guard let nameCellViewModel = nameCellViewModel, let dateCellViewModel = dateCellViewModel, let backgroundImageCellViewModel = backgroundImageCellViewModel  else { return  }
        
        cells = [
            .titleSubtitle(
                nameCellViewModel
            ),
            .titleSubtitle(
                dateCellViewModel
            ),
            .titleSubtitle(
                backgroundImageCellViewModel
            )
        ]
    }
    
}
