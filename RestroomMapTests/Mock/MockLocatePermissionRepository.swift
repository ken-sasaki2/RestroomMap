//
//  MockLocatePermissionRepository.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockLocatePermissionRepository: LocatePermissionRepositoryInterface {
    var delegate: LocatePermissionRepositoryDelegate?


    var isGetAuthorizationStatusCalled = false
    func getAuthorizationStatus() -> AuthorizationStatusEntity {
        isGetAuthorizationStatusCalled = true

        return .authorizedWhenInUse
    }


    var isRequestWhenInUseCalled = false
    func requestWhenInUse(_ complication: @escaping (AuthorizationStatusEntity) -> Void) {
        isRequestWhenInUseCalled = true
    }


    var isStartUpdatingLocationCalled = false
    func startUpdatingLocation() {
        isStartUpdatingLocationCalled = true
    }
}
