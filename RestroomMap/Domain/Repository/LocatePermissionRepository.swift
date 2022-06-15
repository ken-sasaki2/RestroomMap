//
//  LocatePermissionRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//

import Foundation

protocol LocatePermissionRepositoryInterface {
    var delegate: LocatePermissionRepositoryDelegate? { get set }
    func getAuthorizationStatus() -> AuthorizationStatusEntity
    func requestWhenInUse(_ complication: @escaping (AuthorizationStatusEntity) -> Void)
    func startUpdatingLocation()
}


protocol LocatePermissionRepositoryDelegate: AnyObject {
    func didUpdatedLocation(_ entity: CurrentLocationEntity)
    func didFailWithError()
}


final class LocatePermissionRepository: LocatePermissionRepositoryInterface {
    private var dataStore: LocatePermissionDataStoreInterface
    weak var delegate: LocatePermissionRepositoryDelegate?


    init(dataStore: LocatePermissionDataStoreInterface) {
        self.dataStore = dataStore
    }


    func getAuthorizationStatus() -> AuthorizationStatusEntity {
        let status = dataStore.getAuthorizationStatus()
        return status
    }


    func requestWhenInUse(_ complication: @escaping (AuthorizationStatusEntity) -> Void) {
        dataStore.requestWhenInUse { status in
            complication(status)
        }
    }


    func startUpdatingLocation() {
        dataStore.delegate = self
        dataStore.startUpdatingLocation()
    }
}


extension LocatePermissionRepository: LocatePermissionDataStoreDelegate {
    func didUpdatedLocation(_ entity: CurrentLocationEntity) {
        delegate?.didUpdatedLocation(entity)
    }


    func didFailWithError() {
        delegate?.didFailWithError()
    }
}
