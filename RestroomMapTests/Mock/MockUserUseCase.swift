//
//  MockUserUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockUserUseCase: UserUseCaseInput {

    var isGetLaunchCountCalled = false
    func getLaunchCount() {
        isGetLaunchCountCalled = true
    }


    var isSaveLaunchCountCalled = false
    func saveLaunchCount() {
        isSaveLaunchCountCalled = true
    }
}
