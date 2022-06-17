//
//  MockLocatePermissionUseCaseOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockLocatePermissionUseCaseOutput: LocatePermissionUseCaseOutput {

    var isStatusDeniedCalled = false
    func statusDenied() {
        isStatusDeniedCalled = true
    }


    var isSuccessLocatePermissionCalled = false
    func successLocatePermission() {
        isSuccessLocatePermissionCalled = true
    }


    var isFailLocatePermissionCalled = false
    func failLocatePermission() {
        isFailLocatePermissionCalled = true
    }
}
