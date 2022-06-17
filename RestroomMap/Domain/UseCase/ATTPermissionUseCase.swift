//
//  ATTPermissionUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation

protocol ATTPermissionUseCaseInput {
    func completeATTPermissionIfCan() async
}


protocol ATTPermissionUseCaseOutput {
    func completeATTPermission()
}


final class ATTPermissionUseCase: ATTPermissionUseCaseInput {
    private let output: ATTPermissionUseCaseOutput
    private let repository: ATTPermissionRepositoryInterface


    init(output: ATTPermissionUseCaseOutput, repository: ATTPermissionRepositoryInterface) {
        self.output = output
        self.repository = repository
    }


    func completeATTPermissionIfCan() async {
        let status = repository.getAuthorizationStatus()
        await actionPerStatus(status)
    }


    func actionPerStatus(_ status: ATTAuthorizationStatusEntity) async {
        if status == .notDetermined {
            await requestAuthorization()
        } else {
            output.completeATTPermission()
        }
    }


    func requestAuthorization() async {
        await repository.requestAuthorization()
        await completeATTPermissionIfCan()
    }
}
