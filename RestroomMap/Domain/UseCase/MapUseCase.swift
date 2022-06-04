//
//  MapUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation


protocol MapUseCaseInterface {
    func showFocusView()
    func hideFocusView()
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


    func showFocusView() {
        presenter.showFocusView()
    }


    func hideFocusView() {
        presenter.hideFocusView()
    }


    func showAddLocationView() {
        let entity = getAuthorizationStatusEntity()

        if !validLocatePermission(entity: entity) {
            presenter.showLocationAlert()
            return
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
        let entity = getAuthorizationStatusEntity()

        if !validLocatePermission(entity: entity) {
            presenter.showLocationAlert()
            return
        }

        presenter.moveCurrentLocationPoint(model: model)
    }


    func getAuthorizationStatusEntity() -> AuthorizationStatusEntity {
        let entity = locatePermissionRepository.getAuthorizationStatus()
        return entity
    }


    func validLocatePermission(entity: AuthorizationStatusEntity) -> Bool {
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
