//
//  MapUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation


protocol MapUseCaseInterface {
    func toggleFocusView()
    func showAddLocationView()
    func showMenuView()
    func getCurrentLocation()
}


final class MapUseCase: MapUseCaseInterface {
    private let presenter: MapPresenterInterface
    private let repository: MapRepositoryInterface


    init(presenter: MapPresenterInterface, repository: MapRepositoryInterface) {
        self.presenter = presenter
        self.repository = repository
    }
    
    
    func toggleFocusView() {
        presenter.toggleFocusView()
    }
    

    func showAddLocationView() {
        presenter.showAddLocationView()
    }


    func showMenuView() {
        presenter.showMenuView()
    }


    func getCurrentLocation() {
        let entity = repository.getCurrentLocationEntity()
        let model = CurrentLocationModelTranslator.translate(entity: entity)
        moveCurrentLocationPoint(model: model)
    }


    private func moveCurrentLocationPoint(model: CurrentLocationModel) {
        presenter.moveCurrentLocationPoint(model: model)
    }
}
