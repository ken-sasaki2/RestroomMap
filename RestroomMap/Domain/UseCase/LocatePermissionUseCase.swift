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
    private var repository: LocatePermissionRepositoryInterface
    private let presenter: LocatePermissionPresenterinterface


    init(repository: LocatePermissionRepositoryInterface, presenter: LocatePermissionPresenterinterface) {
        self.repository = repository
        self.presenter = presenter
    }


    func getAuthorizationStatus() {
        let status = repository.getAuthorizationStatus()
        onNextPageButtonTapped(status)
    }


    private func onNextPageButtonTapped(_ status: AuthorizationStatusEntity) {
        switch status {
        case .notDetermined:
            repository.requestWhenInUse { status in
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
        repository.delegate = self
        repository.startUpdatingLocation()
    }


    func openSettingPage() {
        presenter.openSettingPage()
    }
}


extension LocatePermissionUseCase: LocatePermissionRepositoryDelegate {
    func didUpdatedLocation(_ repository: LocatePermissionRepository, entity: CurrentLocationEntity) {
        print("kenken1")
        // ローカルに位置情報保存して
        // 画面遷移
    }

    func didFailWithError(_ repository: LocatePermissionRepository) {
        print("kenken2")
    }
}
