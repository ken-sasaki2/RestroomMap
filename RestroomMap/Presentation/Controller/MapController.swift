//
//  MapController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

final class MapController {
    private let mapUseCaseInput: MapUseCaseInput
    private let indicatorUseCaseInput: IndicatorUseCaseInput


    init(mapUseCaseInput: MapUseCaseInput, indicatorUseCaseInput: IndicatorUseCaseInput) {
        self.mapUseCaseInput = mapUseCaseInput
        self.indicatorUseCaseInput = indicatorUseCaseInput
    }


    func onPlusButtonTapped() {
        mapUseCaseInput.showFocusView()
    }


    func onCancelAddLocationButtonTapped() {
        mapUseCaseInput.hideFocusView()
    }


    func onAddLocationButtonTapped() {
        mapUseCaseInput.showAddLocationView()
    }


    func onLocationButtonTapped() {
        getCurrentLocation()
    }


    func onMenuButtonTapped() {
        mapUseCaseInput.showMenuView()
    }


    func getCurrentLocation() {
        mapUseCaseInput.getCurrentLocation()
    }


    func showIndicatorView() {
        indicatorUseCaseInput.show()
    }


    func hideIndicatorView() {
        indicatorUseCaseInput.hide()
    }
}
