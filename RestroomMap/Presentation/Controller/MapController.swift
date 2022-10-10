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
    private let locationFetchUseCaseInput: LocationFetchUseCaseInput


    init(mapUseCaseInput: MapUseCaseInput, indicatorUseCaseInput: IndicatorUseCaseInput, locationFetchUseCaseInput: LocationFetchUseCaseInput) {
        self.mapUseCaseInput = mapUseCaseInput
        self.indicatorUseCaseInput = indicatorUseCaseInput
        self.locationFetchUseCaseInput = locationFetchUseCaseInput
    }


    func onPlusButtonTapped() {
        mapUseCaseInput.showFocusView()
    }


    func onCancelAddLocationButtonTapped() {
        mapUseCaseInput.hideFocusView()
    }


    func onAddLocationButtonTapped() {
        mapUseCaseInput.showAddLocationViewIfCan()
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


    func toggleIndicator() {
        indicatorUseCaseInput.toggleIndicator()
    }


    func fetchLocation() {
        Task {
            await locationFetchUseCaseInput.fetchLocation()
        }
    }
}
