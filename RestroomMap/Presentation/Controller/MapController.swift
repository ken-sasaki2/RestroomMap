//
//  MapController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

final class MapController {
    private let mapUseCase: MapUseCaseInterface

    init(mapUseCase: MapUseCaseInterface) {
        self.mapUseCase = mapUseCase
    }


    func onPlusButtonTapped() {
        mapUseCase.onPlusButtonTapped()
    }


    func onCancelAddLocationButtonTapped() {
        mapUseCase.onCancelAddLocationButtonTapped()
    }


    func onAddLocationButtonTapped() {
        mapUseCase.onAddLocationButtonTapped()
    }


    func onCurrentLocationButtonTapped() {
        mapUseCase.onCurrentLocationButtonTapped()
    }


    func onMenuButtonTapped() {
        mapUseCase.onMenuButtonTapped()
    }
}
