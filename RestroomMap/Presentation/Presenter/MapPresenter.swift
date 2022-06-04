//
//  MapPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

protocol MapPresenterInterface {
    func showFocusView()
    func hideFocusView()
    func showAddLocationView()
    func showMenuView()
    func moveCurrentLocationPoint(model: CurrentLocationModel)
    func showLocationAlert()
    func showIndicatorView()
    func hideIndicatorView()
}


final class MapPresenter: MapPresenterInterface {
    let viewModel: MapViewModel


    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }


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


    func showIndicatorView() {
        viewModel.isShowIndicatorView = true
    }

    func hideIndicatorView() {
        viewModel.isShowIndicatorView = false
    }
}
