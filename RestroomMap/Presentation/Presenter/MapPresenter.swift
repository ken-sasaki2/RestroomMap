//
//  MapPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation


final class MapPresenter {
    let viewModel: MapViewModel

    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }
}


extension MapPresenter: MapUseCaseOutput {
    func showFocusView() {
        viewModel.isShowFocusView = true
    }


    func hideFocusView() {
        viewModel.isShowFocusView = false
    }


    func showAddLocationView() {
        hideFocusView()
        viewModel.isShowAddLocationView = true
    }


    func showMenuView() {
        viewModel.isShowMenuView = true
    }


    func moveCurrentLocationPoint(model: CurrentLocationModel) {
        viewModel.currentLocation = model
    }


    func showLocationAlert() {
        viewModel.isShowLocationAlert = true
    }
}


extension MapPresenter: IndicatorUseCaseOutput {
    func showIndicatorView() {
        viewModel.isShowIndicatorView = true
    }

    func hideIndicatorView() {
        viewModel.isShowIndicatorView = false
    }
}
