//
//  AppDelegateController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/29.
//

import Foundation

final class AppDelegateController {
    private let userUseCaseInput: UserUseCaseInput

    init(userUseCaseInput: UserUseCaseInput) {
        self.userUseCaseInput = userUseCaseInput
    }


    func saveLaunchCount() {
        userUseCaseInput.saveLaunchCount()
    }


    func getLaunchCount() {
        userUseCaseInput.getLaunchCount()
    }
}
