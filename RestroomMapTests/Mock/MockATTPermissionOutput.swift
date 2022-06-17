//
//  MockATTPermissionOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation


final class MockATTPermissionOutput: ATTPermissionUseCaseOutput {
    var isCompleteATTPermissionCalled = false

    func completeATTPermission() {
        isCompleteATTPermissionCalled = true
    }
}
