//
//  MapUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

protocol MapUseCaseInterface {
    func onPlusButtonTapped()
    func onCancelAddLocationButtonTapped()
    func onAddLocationButtonTapped()
    func onCurrentLocationButtonTapped()
    func onMenuButtonTapped()
}

final class MapUseCase: MapUseCaseInterface {
    private let mapPresenter: MapPresenterInterface

    init(mapPresenter: MapPresenterInterface) {
        self.mapPresenter = mapPresenter
    }


    func onPlusButtonTapped() {
        mapPresenter.toggleFocusView()
    }


    func onCancelAddLocationButtonTapped() {
        mapPresenter.toggleFocusView()
    }


    func onAddLocationButtonTapped() {
        mapPresenter.isShowAddLocationView()
    }


    func onCurrentLocationButtonTapped() {
        print("現在地へ遷移させる")
    }


    func onMenuButtonTapped() {
        mapPresenter.isShowMenuView()
    }
}
