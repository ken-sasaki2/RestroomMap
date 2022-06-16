//
//  MockLocatePermissionUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockLocatePermissionUseCase: LocatePermissionUseCaseInput {
    let locatePermissionRepository = MockLocatePermissionRepository()
    let userRepository = MockUserRepository()
    let output = MockLocatePermissionUseCaseOutput()


    var isStartUpdatingLocationIfCanCalled = false
    func startUpdatingLocationIfCan() {
        isStartUpdatingLocationIfCanCalled = true
    }


    var isActionPerStatusCalled = false
    func actionPerStatus(_ status: AuthorizationStatusEntity) {
        isActionPerStatusCalled = true

        if status == .authorizedAlways {
            startUpdatingLocation()
        }

        if status == .authorizedWhenInUse {
            startUpdatingLocation()
        }
    }


    var isStartUpdatingLocationCalled = false
    func startUpdatingLocation() {
        isStartUpdatingLocationCalled = true

        locatePermissionRepository.startUpdatingLocation()
    }


    var isOpenSettingPageCaled = false
    func openSettingPage() {
        isOpenSettingPageCaled = true
    }
}
