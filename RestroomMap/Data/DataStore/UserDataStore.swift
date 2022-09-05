//
//  UserDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/18.
//

import SwiftUI


protocol UserDataStoreInterface {
    func saveLocation(entity: CurrentLocationEntity)
    func saveLaunchCount()
    func getLaunchCount() -> LaunchCountEntity
    func saveDeviceId()
}


final class UserDataStore: UserDataStoreInterface {
    let userDefaults = UserDefaultsEntity()


    func saveLocation(entity: CurrentLocationEntity) {
        userDefaults.lat = entity.lat
        userDefaults.lng = entity.lng
    }


    func saveLaunchCount() {
        userDefaults.launchCount = userDefaults.launchCount
    }


    func getLaunchCount() -> LaunchCountEntity {
        let launchCount = userDefaults.launchCount
        let entity = LaunchCountEntity(launchCount: launchCount)

        return entity
    }


    func getDeviceId() -> DeviceIdEntity? {
        guard let device = UIDevice.current.identifierForVendor else {
            return nil
        }
        let entity = DeviceIdEntity(deviceId: device.uuidString)

        return entity
    }


    func saveDeviceId() {
        guard let entity = getDeviceId() else {
            return
        }
        userDefaults.deviceId = entity.deviceId
    }
}
