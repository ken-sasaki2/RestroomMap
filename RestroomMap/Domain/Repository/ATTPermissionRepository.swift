//
//  ATTPermissionRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation


protocol ATTPermissionRepositoryInterface {
    func getAuthorizationStatus() -> ATTAuthorizationStatusEntity
    func requestAuthorization() async
}


final class ATTPermissionRepository: ATTPermissionRepositoryInterface {
    private let dataStore: ATTPermissionDataStoreInterface


    init(dataStore: ATTPermissionDataStoreInterface) {
        self.dataStore = dataStore
    }


    func getAuthorizationStatus() -> ATTAuthorizationStatusEntity {
        let status = dataStore.getAuthorizationStatus()
        return status
    }


    func requestAuthorization() async {
        return await dataStore.requestAuthorization()
    }
}
