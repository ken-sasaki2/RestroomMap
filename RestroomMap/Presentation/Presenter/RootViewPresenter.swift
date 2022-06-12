//
//  RootViewPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import Foundation


protocol RootViewPresenterInterface {
    func showLocatePermissionView()
    func showATTPermissionView()
    func showMapView()
}


final class RootViewPresenter: RootViewPresenterInterface {

    func showLocatePermissionView() {
        RootViewModel.shared.changeRootView(rootView: .location)
    }


    func showATTPermissionView() {
        RootViewModel.shared.changeRootView(rootView: .tracking)
    }


    func showMapView() {
        RootViewModel.shared.changeRootView(rootView: .map)
    }
}
