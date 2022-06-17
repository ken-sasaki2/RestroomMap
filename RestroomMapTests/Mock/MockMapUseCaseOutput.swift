//
//  MockMapUseCaseOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockMapUseCaseOutput: MapUseCaseOutput {

    var isShowFocusViewCalled = false
    func showFocusView() {
        isShowFocusViewCalled = true
    }


    var isHideFocusViewCalled = false
    func hideFocusView() {
        isHideFocusViewCalled = true
    }


    var isShowAddLocationViewCalled = false
    func showAddLocationView() {
        isShowAddLocationViewCalled = true
    }


    var isShowMenuViewCalled = false
    func showMenuView() {
        isShowMenuViewCalled = true
    }


    var isMoveCurrentLocationPointCalled = false
    func moveCurrentLocationPoint(model: CurrentLocationModel) {
        isMoveCurrentLocationPointCalled = true
    }


    var isShowLocationAlertCalled = false
    func showLocationAlert() {
        isShowLocationAlertCalled = true
    }
}
