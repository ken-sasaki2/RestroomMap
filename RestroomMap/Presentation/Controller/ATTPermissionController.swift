//
//  ATTPermissionController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation


final class ATTPermissionController {
    private let useCaseInput: ATTPermissionUseCaseInput


    init(useCaseInput: ATTPermissionUseCaseInput) {
        self.useCaseInput = useCaseInput
    }


    func onNextPegeButtonTapped() {
        Task {
            await useCaseInput.completeATTPermissionIfCan()
        }
    }
}
