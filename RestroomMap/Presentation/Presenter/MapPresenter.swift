//
//  MapPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

protocol MapPresenterInterface {
    func toggleFocusView()
    func isShowAddLocationView()
    func isShowMenuView()
    func moveCurrentLocationPoint(model: CurrentLocationModel)
}

final class MapPresenter: MapPresenterInterface {
    let viewModel: MapViewModel

    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }


    func toggleFocusView() {
        viewModel.isShowFocusView.toggle()
    }


    func isShowAddLocationView() {
        toggleFocusView()
        viewModel.isShowAddLocationView.toggle()
    }


    func isShowMenuView() {
        viewModel.isShowMenuView.toggle()
    }


    func moveCurrentLocationPoint(model: CurrentLocationModel) {
        viewModel.currentLocation = model
    }
}
