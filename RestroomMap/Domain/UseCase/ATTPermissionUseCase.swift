//
//  ATTPermissionUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation


protocol ATTPermissionUseCaseInterface {
    func getAuthorizationStatus() async
}

final class ATTPermissionUseCase: ATTPermissionUseCaseInterface {
    private let repository: ATTPermissionRepository
    private let presenter: RootViewPresenterInterface


    init(repository: ATTPermissionRepository, presenter: RootViewPresenterInterface) {
        self.repository = repository
        self.presenter = presenter
    }


    func getAuthorizationStatus() async {
        let status = repository.getAuthorizationStatus()

        if status == .notDetermined {
            await requestAuthorization()
        } else {
            presenter.showMapView()
        }
    }


    private func requestAuthorization() async {
        await repository.requestAuthorization()
        await getAuthorizationStatus()
    }
}
