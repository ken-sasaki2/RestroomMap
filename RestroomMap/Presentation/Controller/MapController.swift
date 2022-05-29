//
//  MapController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

final class MapController {
    private let mapUseCase: MapUseCaseInterface
    private let userUseCase: UserUseCaseInterface


    init(mapUseCase: MapUseCaseInterface, userUseCase: UserUseCaseInterface) {
        self.mapUseCase = mapUseCase
        self.userUseCase = userUseCase
    }


    func onPlusButtonTapped() {
        mapUseCase.toggleFocusView()
    }


    func onCancelAddLocationButtonTapped() {
        mapUseCase.toggleFocusView()
    }


    func onAddLocationButtonTapped() {
        mapUseCase.showAddLocationView()
    }


    func onMenuButtonTapped() {
        mapUseCase.showMenuView()
    }


    func getCurrentLocation() {
        mapUseCase.getCurrentLocation()
    }


    func getLaunchCount() {
        userUseCase.getLaunchCount()
    }
}
