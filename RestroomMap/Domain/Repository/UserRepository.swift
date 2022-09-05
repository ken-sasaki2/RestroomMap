//
//  UserRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/18.
//

import Foundation

protocol UserRepositoryInterface {
    func saveLocation(entity: CurrentLocationEntity)
    func saveLaunchCount()
    func getLaunchCount() -> LaunchCountEntity
    func saveDeviceId()
}


final class UserRepository: UserRepositoryInterface {
    private let dataStore: UserDataStoreInterface


    init(dataStore: UserDataStoreInterface) {
        self.dataStore = dataStore
    }


    func saveLocation(entity: CurrentLocationEntity) {
        dataStore.saveLocation(entity: entity)
    }


    func saveLaunchCount() {
        dataStore.saveLaunchCount()
    }


    func getLaunchCount() -> LaunchCountEntity {
        let entity = dataStore.getLaunchCount()

        return entity
    }


    func saveDeviceId() {
        dataStore.saveDeviceId()
    }
}
