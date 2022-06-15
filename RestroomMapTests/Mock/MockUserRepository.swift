//
//  MockUserRepository.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockUserRepository: UserRepositoryInterface {

    var isSaveLocationCalled = false
    func saveLocation(entity: CurrentLocationEntity) {
        isSaveLocationCalled = true
    }


    var isSaveLaunchCountCalled = false
    func saveLaunchCount() {
        isSaveLaunchCountCalled = true
    }


    var isGetLaunchCountCalled = false
    func getLaunchCount() -> LaunchCountEntity {
        isGetLaunchCountCalled = true
        let entity = LaunchCountEntity(launchCount: 1)

        return entity
    }
}
