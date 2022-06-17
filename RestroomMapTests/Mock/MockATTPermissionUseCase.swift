//
//  MockATTPermissionUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockATTPermissionUseCase: ATTPermissionUseCaseInput {
    let repository = MockATTPermissionRepository()
    let output = MockATTPermissionOutput()


    var isCompleteATTPermissionIfCanCalled = false
    func completeATTPermissionIfCan() async {
        isCompleteATTPermissionIfCanCalled = true
    }


    var isActionPerStatusCalled = false
    func actionPerStatus(_ status: ATTAuthorizationStatusEntity) async {
        isActionPerStatusCalled = true
    }


    var isRequestAuthorizationCalled = false
    func requestAuthorization() async {
        isRequestAuthorizationCalled = true
    }
}
