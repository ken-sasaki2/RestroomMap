//
//  AppDelegateController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/29.
//

import Foundation

final class AppDelegateController {
    private let launchUseCaseInput: LaunchUseCaseInput

    init(launchUseCaseInput: LaunchUseCaseInput) {
        self.launchUseCaseInput = launchUseCaseInput
    }


    func saveLaunchCount() {
        launchUseCaseInput.saveLaunchCount()
    }


    func actionPerFirstLaunchIfCan() {
        launchUseCaseInput.actionPerFirstLaunchIfCan()
    }
}
