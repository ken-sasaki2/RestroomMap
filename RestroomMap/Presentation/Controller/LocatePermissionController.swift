//
//  LocatePermissionController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//

import Foundation

final class LocatePermissionController {
    private let useCase: LocatePermissionUseCaseInterface

    init(useCase: LocatePermissionUseCaseInterface) {
        self.useCase = useCase
    }


    func onNextPageButtonTapped() {
        useCase.getAuthorizationStatus()
    }


    func onGoToSettingPageButtonTapped() {
        useCase.openSettingPage()
    }
}
