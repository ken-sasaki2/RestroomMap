//
//  AppDelegateController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/29.
//

import Foundation

final class AppDelegateController {
    private let userUseCase: UserUseCaseInterface

    init(userUseCase: UserUseCaseInterface) {
        self.userUseCase = userUseCase
    }


    func saveLaunchCount() {
        userUseCase.saveLaunchCount()
    }


    func getLaunchCount() {
        userUseCase.getLaunchCount()
    }
}
