//
//  UserUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation


protocol UserUseCaseInput {
    func getLaunchCount()
    func saveLaunchCount()
}


protocol UserUseCaseOutput {
    func showLocatePermissionView()
}


final class UserUseCase: UserUseCaseInput {
    private let output: UserUseCaseOutput
    private let repository: UserRepositoryInterface


    init(output: UserUseCaseOutput, repository: UserRepositoryInterface) {
        self.output = output
        self.repository = repository
    }


    func getLaunchCount() {
        let entity = repository.getLaunchCount()

        if validFirstLaunch(entity: entity) {
            output.showLocatePermissionView()
        }
    }


    func saveLaunchCount() {
        repository.saveLaunchCount()
    }


    func validFirstLaunch(entity: LaunchCountEntity) -> Bool {
        if entity.launchCount == 1 {
            return true
        } else {
            return false
        }
    }
}
