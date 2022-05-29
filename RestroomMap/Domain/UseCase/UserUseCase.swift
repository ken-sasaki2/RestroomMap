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
    private let mapPresenter: MapPresenterInterface


    init(repository: UserRepositoryInterface, mapPresenter: MapPresenterInterface) {
        self.repository = repository
        self.mapPresenter = mapPresenter
    }


    func saveLocation() {
        repository.saveLaunchCount()
    }


    func getLaunchCount() {
        let entity = repository.getLaunchCount()

        if validFirstLaunch(entity: entity) {
            mapPresenter.showLocatePermissionView()
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
