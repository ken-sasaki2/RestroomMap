//
//  MockLocatePermissionDataStore.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockLocatePermissionDataStore: LocatePermissionDataStoreInterface {
    var status: AuthorizationStatusEntity = .authorizedWhenInUse
    var delegate: LocatePermissionDataStoreDelegate?


    var isGetAuthorizationStatusCalled = false
    func getAuthorizationStatus() -> AuthorizationStatusEntity {
        isGetAuthorizationStatusCalled = true

        return status
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
