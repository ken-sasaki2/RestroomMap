//
//  LocatePermissionController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//

import Foundation

final class LocatePermissionController {
    private let useCaseInput: LocatePermissionUseCaseInput


    init(useCaseInput: LocatePermissionUseCaseInput) {
        self.useCaseInput = useCaseInput
    }


    func onNextPageButtonTapped() {
        useCaseInput.startUpdatingLocationIfCan()
    }


    func onGoToSettingPageButtonTapped() {
        useCaseInput.openSettingPage()
    }
}
