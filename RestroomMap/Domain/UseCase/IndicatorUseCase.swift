//
//  IndicatorUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import Foundation


protocol IndicatorUseCaseInterface {
    func showIndicatorViewFromMapView()
    func hideIndicatorViewFromMapView()
}


final class IndicatorUseCase: IndicatorUseCaseInterface {
    private let mapPresenter: MapPresenterInterface

    init(mapPresenter: MapPresenterInterface) {
        self.mapPresenter = mapPresenter
    }


    func showIndicatorViewFromMapView() {
        mapPresenter.showIndicatorView()
    }

    func hideIndicatorViewFromMapView() {
        mapPresenter.hideIndicatorView()
    }
}
