//
//  MapUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation


protocol MapUseCaseInput {
    func showFocusView()
    func hideFocusView()
    func showAddLocationView()
    func showMenuView()
    func getCurrentLocation()
}


protocol MapUseCaseOutput {
    func showFocusView()
    func hideFocusView()
    func showAddLocationView()
    func showMenuView()
    func moveCurrentLocationPoint(model: CurrentLocationModel)
    func showLocationAlert()
}


final class MapUseCase: MapUseCaseInput {
    private let output: MapUseCaseOutput
    private let mapRepository: MapRepositoryInterface
    private let locatePermissionRepository: LocatePermissionRepositoryInterface


    init(
        output: MapUseCaseOutput,
        mapRepository: MapRepositoryInterface,
        locatePermissionRepository: LocatePermissionRepositoryInterface
    ) {
        self.output = output
        self.mapRepository = mapRepository
        self.locatePermissionRepository = locatePermissionRepository
    }


    func showFocusView() {
        output.showFocusView()
    }


    func hideFocusView() {
        output.hideFocusView()
    }


    func showAddLocationView() {
        let entity = getAuthorizationStatusEntity()

        if !validLocatePermission(entity: entity) {
            output.showLocationAlert()
            return
        }

        output.showAddLocationView()
    }


    func showMenuView() {
        output.showMenuView()
    }


    func getCurrentLocation() {
        let entity = mapRepository.getCurrentLocationEntity()
        let model = CurrentLocationModelTranslator.translate(entity: entity)
        moveCurrentLocationPoint(model: model)
    }


    private func moveCurrentLocationPoint(model: CurrentLocationModel) {
        let entity = getAuthorizationStatusEntity()

        if !validLocatePermission(entity: entity) {
            output.showLocationAlert()
            return
        }

        output.moveCurrentLocationPoint(model: model)
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
