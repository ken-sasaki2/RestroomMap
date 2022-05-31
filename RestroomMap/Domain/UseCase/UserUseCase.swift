//
//  UserUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation

protocol UserUseCaseInterface {
    func saveLocation()
    func getLaunchCount()
    func saveLaunchCount()
}


final class UserUseCase: UserUseCaseInterface {
    private let repository: UserRepositoryInterface
    private let rootViewPresenter: RootViewPresenterInterface


    init(repository: UserRepositoryInterface, rootViewPresenter: RootViewPresenterInterface) {
        self.repository = repository
        self.rootViewPresenter = rootViewPresenter
    }


    func saveLocation() {
        repository.saveLaunchCount()
    }


    func getLaunchCount() {
        let entity = repository.getLaunchCount()

        if validFirstLaunch(entity: entity) {
            rootViewPresenter.showLocatePermissionView()
        }
    }


    func saveLaunchCount() {
        repository.saveLaunchCount()
    }


    private func validFirstLaunch(entity: LaunchCountEntity) -> Bool {
        if entity.launchCount == 1 {
            return true
        } else {
            return false
        }
    }
}
