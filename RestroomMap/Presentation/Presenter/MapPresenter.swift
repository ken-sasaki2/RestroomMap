//
//  MapPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

protocol MapPresenterInterface {
    func toggleFocusView()
    func showAddLocationView()
    func showMenuView()
    func moveCurrentLocationPoint(model: CurrentLocationModel)
    func showLocatePermissionView()
    func showIndicatorView()
}


final class MapPresenter: MapPresenterInterface {
    let viewModel: MapViewModel


    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }


    func toggleFocusView() {
        viewModel.isShowFocusView.toggle()
    }


    func showAddLocationView() {
        toggleFocusView()
        viewModel.isShowAddLocationView = true
    }


    func showMenuView() {
        viewModel.isShowMenuView = true
    }


    func moveCurrentLocationPoint(model: CurrentLocationModel) {
        viewModel.currentLocation = model
    }


    func showLocatePermissionView() {
        viewModel.isShowLocatePermissionView = true
    }


    func showIndicatorView() {
        viewModel.isShowIndicatorView = true
    }
}
