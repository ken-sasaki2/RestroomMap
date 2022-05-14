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
}

final class MapPresenter: MapPresenterInterface {
    let mapViewModel: MapViewModel

    init(mapViewModel: MapViewModel) {
        self.mapViewModel = mapViewModel
    }


    func toggleFocusView() {
        mapViewModel.isShowFocusView.toggle()
    }


    func isShowAddLocationView() {
        toggleFocusView()
        mapViewModel.isShowAddLocationView.toggle()
    }


    func isShowMenuView() {
        mapViewModel.isShowMenuView.toggle()
    }
}
