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


    var isGetAuthorizationStatusCalled = false
    func getAuthorizationStatus() async {
        isGetAuthorizationStatusCalled = true

        let status = repository.getAuthorizationStatus()
        await actionPerStatus(status)
    }


    var isActionPerStatusCalled = false
    func actionPerStatus(_ status: ATTAuthorizationStatusEntity) async {
        isActionPerStatusCalled = true

        if status == .notDetermined {
            await requestAuthorization()
        } else {
            output.completeATTPermission()
        }
    }


    var isRequestAuthorizationCalled = false
    func requestAuthorization() async {
        isRequestAuthorizationCalled = true

        await repository.requestAuthorization()
        await getAuthorizationStatus()
    }
}
