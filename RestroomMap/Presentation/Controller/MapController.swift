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
    private let indicatorUseCase: IndicatorUseCaseInterface


    init(mapUseCase: MapUseCaseInterface, userUseCase: UserUseCaseInterface, indicatorUseCase: IndicatorUseCaseInterface) {
        self.mapUseCase = mapUseCase
        self.userUseCase = userUseCase
        self.indicatorUseCase = indicatorUseCase
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


    func onLocationButtonTapped() {
        getCurrentLocation()
    }


    func onMenuButtonTapped() {
        mapUseCase.showMenuView()
    }


    func getCurrentLocation() {
        mapUseCase.getCurrentLocation()
    }


    func showIndicatorView() {
        indicatorUseCase.showIndicatorViewFromMapView()
    }


    func hideIndicatorView() {
        indicatorUseCase.hideIndicatorViewFromMapView()
    }
}
