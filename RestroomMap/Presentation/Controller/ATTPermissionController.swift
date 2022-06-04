//
//  ATTPermissionController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation


final class ATTPermissionController {
    private let useCase: ATTPermissionUseCaseInterface


    init(useCase: ATTPermissionUseCaseInterface) {
        self.useCase = useCase
    }


    func onNextPegeButtonTapped() {
        Task {
            await useCase.getAuthorizationStatus()
        }
    }
}
