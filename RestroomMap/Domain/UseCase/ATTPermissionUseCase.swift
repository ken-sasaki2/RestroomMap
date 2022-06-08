//
//  ATTPermissionUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation

protocol ATTPermissionUseCaseInput {
    func getAuthorizationStatus() async
}


protocol ATTPermissionUseCaseOutput {
    func completeATTPermission()
}


final class ATTPermissionUseCase: ATTPermissionUseCaseInput {
    private let output: ATTPermissionUseCaseOutput
    private let repository: ATTPermissionRepository


    init(output: ATTPermissionUseCaseOutput, repository: ATTPermissionRepository) {
        self.output = output
        self.repository = repository
    }


    func getAuthorizationStatus() async {
        let status = repository.getAuthorizationStatus()

        if status == .notDetermined {
            await requestAuthorization()
        } else {
            output.completeATTPermission()
        }
    }


    private func requestAuthorization() async {
        await repository.requestAuthorization()
        await getAuthorizationStatus()
    }
}
