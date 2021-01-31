//
//  EditEventViewModel.swift
//  EventsMVVM-Navigation+Coordinator
//
//  Created by mohamed  habib on 15/12/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

final class EditEventViewModel {
    
    let title = "Edit"
    
    //Add Closure to update tableView
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    
    private(set) var cells: [EditEventViewModel.Cell] = []
    weak var coordinator: EditEventCoordinator?
    
    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var backgroundImageCellViewModel: TitleSubtitleCellViewModel?
    private var  cellBuilder: EventCellBuilder
    private let eventService: EventServiceProtocol
    private let event: Event
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyy"
        return dateFormatter
    }()
    
    init(event: Event,
         cellBuilder: EventCellBuilder,
         eventService: EventServiceProtocol = EventService()
    ) {
        self.event = event
        self.cellBuilder = cellBuilder
        self.eventService = eventService
    }
    
    func viewDidLoad() {
        setupCells()
        onUpdate()
    }
    
    func viewDidDisapear()  {
        coordinator?.didFinish()
    }
    
    func numberOfRows() -> Int  {
        return cells.count
    }
    func cell(for indexPath: IndexPath) -> Cell  {
        return cells[indexPath.row]
    }
    
    // Done button in toolbar
    func tappedDone()  {
        //extract info from cell view models and
        print("tapped done to save data ")
        
        guard let name = nameCellViewModel?.subtitle,
            let dateString = dateCellViewModel?.subtitle,
            let image = backgroundImageCellViewModel?.image,
            let date = dateFormatter.date(from: dateString)
            else { return  }
        //save in core data
        eventService.perform(
            .update(event),
            EventService.EventInputData(
                      name: name,
                      date: date,
                      image: image)
              )
        //tell coordinator to dismiss
        coordinator?.didFinishUpdateEvent()
        
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
    deinit {
        print("deinit from Add Event View Model ")
    }
}


private extension EditEventViewModel {
    
    func setupCells()  {
        
        nameCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.text)
        dateCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.date) { [weak self] in
            // to reload cell when insert date
            self?.onUpdate()
        }
        backgroundImageCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.image) { [weak self] in
            // to reload cell when insert image
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
        
        guard let name = event.name,
            let date = event.date,
            let imageData = event.image,
            let image = UIImage(data: imageData)
            else { return  }
        
        nameCellViewModel.update(name)
        dateCellViewModel.update(date)
        backgroundImageCellViewModel.update(image)
        
    }
    
}

