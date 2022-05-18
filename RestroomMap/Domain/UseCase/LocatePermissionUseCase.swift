//
//  LocatePermissionUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//

import Foundation

protocol LocatePermissionUseCaseInterface {
    func getAuthorizationStatus()
    func openSettingPage()
}


final class LocatePermissionUseCase: LocatePermissionUseCaseInterface {
    private var locatePermissionRepository: LocatePermissionRepositoryInterface
    private let userRepository: UserRepositoryInterface
    private let presenter: LocatePermissionPresenterinterface


    init(
        locatePermissionRepository: LocatePermissionRepositoryInterface,
        userRepository: UserRepositoryInterface,
        presenter: LocatePermissionPresenterinterface
    ) {
        self.locatePermissionRepository = locatePermissionRepository
        self.userRepository = userRepository
        self.presenter = presenter
    }


    func getAuthorizationStatus() {
        let status = locatePermissionRepository.getAuthorizationStatus()
        onNextPageButtonTapped(status)
    }


    private func onNextPageButtonTapped(_ status: AuthorizationStatusEntity) {
        switch status {
        case .notDetermined:
            locatePermissionRepository.requestWhenInUse { status in
                self.onNextPageButtonTapped(status)
            }
        case .restricted:
            presenter.isShowDeniedAlert()
        case .denied:
            presenter.isShowDeniedAlert()
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
        presenter.openSettingPage()
    }
}


extension LocatePermissionUseCase: LocatePermissionRepositoryDelegate {
    func didUpdatedLocation(_ repository: LocatePermissionRepository, entity: CurrentLocationEntity) {
        print("kenken1")
        userRepository.saveLocation(entity: entity)
        // 画面遷移
    }
    

    func didFailWithError(_ repository: LocatePermissionRepository) {
        print("kenken2")
    }
}
