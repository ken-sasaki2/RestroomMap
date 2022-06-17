//
//  MockATTPermissionRepository.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation


final class MockATTPermissionRepository: ATTPermissionRepositoryInterface {
    var entity: ATTAuthorizationStatusEntity = .authorized
    var isGetAuthorizationStatusCalled = false
    var isRequestAuthorizationCalled = false


    func getAuthorizationStatus() -> ATTAuthorizationStatusEntity {
        isGetAuthorizationStatusCalled = true
        return entity
    }


    func requestAuthorization() async {
        isRequestAuthorizationCalled = true
    }
}
