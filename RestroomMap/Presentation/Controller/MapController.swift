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
        useCase.toggleFocusView()
    }


    func onCancelAddLocationButtonTapped() {
        useCase.toggleFocusView()
    }


    func onAddLocationButtonTapped() {
        useCase.showAddLocationView()
    }


    func onMenuButtonTapped() {
        useCase.showMenuView()
    }


    func getCurrentLocation() {
        useCase.getCurrentLocation()
    }
}
