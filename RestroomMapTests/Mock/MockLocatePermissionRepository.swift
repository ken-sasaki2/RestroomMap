//
//  MockLocatePermissionRepository.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockLocatePermissionRepository: LocatePermissionRepositoryInterface {
    var delegate: LocatePermissionRepositoryDelegate?
    var entity: AuthorizationStatusEntity = .unknown

    
    var isGetAuthorizationStatusCalled = false
    func getAuthorizationStatus() -> AuthorizationStatusEntity {
        isGetAuthorizationStatusCalled = true

        return entity
    }


    var isRequestWhenInUseCalled = false
    func requestWhenInUse(_ complication: @escaping (AuthorizationStatusEntity) -> Void) {
        isRequestWhenInUseCalled = true
        complication(.restricted)
    }


    var isStartUpdatingLocationCalled = false
    func startUpdatingLocation() {
        isStartUpdatingLocationCalled = true
    }
}
