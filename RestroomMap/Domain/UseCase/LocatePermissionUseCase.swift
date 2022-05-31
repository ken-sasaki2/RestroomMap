//
//  LocatePermissionUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//


import SwiftUI

protocol LocatePermissionUseCaseInterface {
    func getAuthorizationStatus()
    func openSettingPage()
}


final class LocatePermissionUseCase: LocatePermissionUseCaseInterface {
    private var locatePermissionRepository: LocatePermissionRepositoryInterface
    private let userRepository: UserRepositoryInterface
    private let locatePermissionPresenter: LocatePermissionPresenterInterface
    private let rootViewPresenter: RootViewPresenterInterface


    init(
        locatePermissionRepository: LocatePermissionRepositoryInterface,
        userRepository: UserRepositoryInterface,
        locatePermissionPresenter: LocatePermissionPresenterInterface,
        rootViewPresenter: RootViewPresenterInterface
    ) {
        self.locatePermissionRepository = locatePermissionRepository
        self.userRepository = userRepository
        self.locatePermissionPresenter = locatePermissionPresenter
        self.rootViewPresenter = rootViewPresenter
    }


    func getAuthorizationStatus() {
        let status = locatePermissionRepository.getAuthorizationStatus()
        actionByAuthorizationStatus(status)
    }


    private func actionByAuthorizationStatus(_ status: AuthorizationStatusEntity) {
        switch status {
        case .notDetermined:
            locatePermissionRepository.requestWhenInUse { status in
                self.actionByAuthorizationStatus(status)
            }
        case .restricted:
            locatePermissionPresenter.showDeniedAlert()
        case .denied:
            locatePermissionPresenter.showDeniedAlert()
        case .authorizedAlways:
            startUpdatingLocation()
        case .authorizedWhenInUse:
            startUpdatingLocation()
        case .unknown:
            return
        }
    }


    private func startUpdatingLocation() {
        locatePermissionRepository.delegate = self
        locatePermissionRepository.startUpdatingLocation()
    }


    func openSettingPage() {
        let urlString = UIApplication.openSettingsURLString

        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}


extension LocatePermissionUseCase: LocatePermissionRepositoryDelegate {
    func didUpdatedLocation(_ repository: LocatePermissionRepository, entity: CurrentLocationEntity) {
        userRepository.saveLocation(entity: entity)
        rootViewPresenter.showATTPermissionView()
    }


    func didFailWithError(_ repository: LocatePermissionRepository) {
        locatePermissionPresenter.failLocatePermission()
    }
}
