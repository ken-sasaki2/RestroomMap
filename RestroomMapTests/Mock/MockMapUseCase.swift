//
//  MockMapUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockMapUseCase: MapUseCaseInput {

    var isShowFocusViewCalled = false
    func showFocusView() {
        isShowFocusViewCalled = true
    }


    var isHideFocusViewCalled = false
    func hideFocusView() {
        isHideFocusViewCalled = true
    }


    var isShowAddLocationViewIfCanCalled = false
    func showAddLocationViewIfCan() {
        isShowAddLocationViewIfCanCalled = true
    }


    var isShowMenuViewCalled = false
    func showMenuView() {
        isShowMenuViewCalled = true
    }


    var isGetCurrentLocationCalled = false
    func getCurrentLocation() {
        isGetCurrentLocationCalled = true
    }
}
