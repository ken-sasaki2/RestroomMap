//
//  MapController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

final class MapController {
    private let useCase: MapUseCaseInterface

    init(useCase: MapUseCaseInterface) {
        self.useCase = useCase
    }


    func onPlusButtonTapped() {
        useCase.onPlusButtonTapped()
    }


    func onCancelAddLocationButtonTapped() {
        useCase.onCancelAddLocationButtonTapped()
    }


    func onAddLocationButtonTapped() {
        useCase.onAddLocationButtonTapped()
    }


    func onMenuButtonTapped() {
        useCase.onMenuButtonTapped()
    }


    func getCurrentLocation() {
        useCase.getCurrentLocation()
    }
}
