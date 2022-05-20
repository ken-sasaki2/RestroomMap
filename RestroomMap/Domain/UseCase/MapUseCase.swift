//
//  MapUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

protocol MapUseCaseInterface {
    func onPlusButtonTapped()
    func onCancelAddLocationButtonTapped()
    func onAddLocationButtonTapped()
    func onMenuButtonTapped()
    func getCurrentLocation()
}


final class MapUseCase: MapUseCaseInterface {
    private let presenter: MapPresenterInterface
    private let repository: MapRepositoryInterface


    init(presenter: MapPresenterInterface, repository: MapRepositoryInterface) {
        self.presenter = presenter
        self.repository = repository
    }


    func onPlusButtonTapped() {
        presenter.toggleFocusView()
    }


    func onCancelAddLocationButtonTapped() {
        presenter.toggleFocusView()
    }


    func onAddLocationButtonTapped() {
        presenter.isShowAddLocationView()
    }


    func onMenuButtonTapped() {
        presenter.isShowMenuView()
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
