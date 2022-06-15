//
//  MockATTPermissionPresenter.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation


final class MockATTPermissionPresenter: ATTPermissionUseCaseOutput {
    var isCompleteATTPermissionCalled = false

    func completeATTPermission() {
        isCompleteATTPermissionCalled = true
    }
}
