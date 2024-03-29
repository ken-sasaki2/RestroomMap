//
//  LaunchUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation


protocol LaunchUseCaseInput {
    func saveLaunchCount()
    func actionPerFirstLaunchIfCan()
}


protocol LaunchUseCaseOutput {
    func showLocatePermissionView()
}


final class LaunchUseCase: LaunchUseCaseInput {
    private let output: LaunchUseCaseOutput
    private let repository: UserRepositoryInterface


    init(output: LaunchUseCaseOutput, repository: UserRepositoryInterface) {
        self.output = output
        self.repository = repository
    }


    func saveLaunchCount() {
        repository.saveLaunchCount()
    }


    func actionPerFirstLaunchIfCan() {
        let entity = repository.getLaunchCount()

        if validFirstLaunch(entity) {
            saveDeviceId()
            output.showLocatePermissionView()
        }
    }


    func validFirstLaunch(_ entity: LaunchCountEntity) -> Bool {
        if entity.launchCount == 1 {
            return true
        } else {
            return false
        }
    }


    func saveDeviceId() {
        repository.saveDeviceId()
    }
}
