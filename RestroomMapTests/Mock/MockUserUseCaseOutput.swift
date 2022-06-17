//
//  MockUserUseCaseOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockUserUseCaseOutput: UserUseCaseOutput {

    var isShowLocatePermissionViewCalled = false
    func showLocatePermissionView() {
        isShowLocatePermissionViewCalled = true
    }
}
