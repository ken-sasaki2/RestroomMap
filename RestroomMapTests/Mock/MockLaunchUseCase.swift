//
//  MockLaunchUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/09/06.
//

import Foundation


final class MockLaunchUseCase: LaunchUseCaseInput {

    var isSaveLaunchCountCalled = false
    func saveLaunchCount() {
        isSaveLaunchCountCalled = true
    }

    var isActionPerFirstlaunchIfCan = false
    func actionPerFirstLaunchIfCan() {
        isActionPerFirstlaunchIfCan = true
    }
}
