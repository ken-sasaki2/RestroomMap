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
    private let mapRepository: MapRepositoryInterface
    private let locatePermissionRepository: LocatePermissionRepositoryInterface


    init(
        presenter: MapPresenterInterface,
        mapRepository: MapRepositoryInterface,
        locatePermissionRepository: LocatePermissionRepositoryInterface
    ) {
        self.presenter = presenter
        self.mapRepository = mapRepository
        self.locatePermissionRepository = locatePermissionRepository
    }


    func toggleFocusView() {
        presenter.toggleFocusView()
    }


    func showAddLocationView() {
        if !validLocatePermission() {
            presenter.showLocationAlert()
        }

        presenter.showAddLocationView()
    }


    func showMenuView() {
        presenter.showMenuView()
    }


    func getCurrentLocation() {
        let entity = mapRepository.getCurrentLocationEntity()
        let model = CurrentLocationModelTranslator.translate(entity: entity)
        moveCurrentLocationPoint(model: model)
    }


    private func moveCurrentLocationPoint(model: CurrentLocationModel) {
        if !validLocatePermission() {
            presenter.showLocationAlert()
        }

        presenter.moveCurrentLocationPoint(model: model)
    }


    private func getAuthorizationStatusEntity() -> AuthorizationStatusEntity {
        let entity = locatePermissionRepository.getAuthorizationStatus()
        return entity
    }


    private func validLocatePermission() -> Bool {
        let entity = getAuthorizationStatusEntity()

        switch entity {
        case .notDetermined:
            return false
        case .restricted:
            return true
        case .denied:
            return false
        case .authorizedAlways:
            return true
        case .authorizedWhenInUse:
            return true
        case .unknown:
            return true
        }
    }
}
