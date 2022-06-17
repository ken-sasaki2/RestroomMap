//
//  MockATTPermissionDataStore.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockATTPermissionDataStore: ATTPermissionDataStoreInterface {

    var isGetAuthorizationStatusCalled = false
    func getAuthorizationStatus() -> ATTAuthorizationStatusEntity {
        isGetAuthorizationStatusCalled = true

        return .authorized
    }


    var isRequestAuthorizationCalled = false
    func requestAuthorization() async {
        isRequestAuthorizationCalled = true
    }
}
