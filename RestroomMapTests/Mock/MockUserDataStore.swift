//
//  MockUserDataStore.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockUserDataStore: UserDataStoreInterface {


    var isSaveLocationCalled = false
    func saveLocation(entity: CurrentLocationEntity) {
        isSaveLocationCalled = true
    }


    var isSaveLaunchCountCalled = false
    func saveLaunchCount() {
        isSaveLaunchCountCalled = true
    }


    func getLaunchCount() -> LaunchCountEntity {
        let entity = LaunchCountEntity(launchCount: 1)

        return entity
    }


    var isSaveDeviceIdCalled = false
    func saveDeviceId() {
        isSaveDeviceIdCalled = true
    }

    var isGetDeviceIdCalled = false
    func getDeviceId() -> DeviceIdEntity? {
        isGetDeviceIdCalled = true
        let entity = DeviceIdEntity(deviceId: TestConst.deviceId)

        return entity
    }
}
