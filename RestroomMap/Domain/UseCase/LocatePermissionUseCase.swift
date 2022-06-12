//
//  LocatePermissionUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//


import SwiftUI

protocol LocatePermissionUseCaseInput {
    func getAuthorizationStatus()
    func openSettingPage()
}


protocol LocatePermissionUseCaseOutput {
    func statusDenied()
    func successLocatePermission()
    func failLocatePermission()
}


final class LocatePermissionUseCase: LocatePermissionUseCaseInput {
    private var locatePermissionRepository: LocatePermissionRepositoryInterface
    private let userRepository: UserRepositoryInterface
    private let output: LocatePermissionUseCaseOutput


    init(
        locatePermissionRepository: LocatePermissionRepositoryInterface,
        userRepository: UserRepositoryInterface,
        output: LocatePermissionUseCaseOutput

    ) {
        self.locatePermissionRepository = locatePermissionRepository
        self.userRepository = userRepository
        self.output = output
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
            output.statusDenied()
        case .denied:
            output.statusDenied()
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
        output.successLocatePermission()
    }


    func didFailWithError(_ repository: LocatePermissionRepository) {
        output.failLocatePermission()
    }
}
