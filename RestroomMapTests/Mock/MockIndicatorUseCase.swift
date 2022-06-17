//
//  MockIndicatorUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockIndicatorUseCase: IndicatorUseCaseInput {

    var isShowCalled = false
    func show() {
        isShowCalled = true
    }


    var isHideCalled = false
    func hide() {
        isHideCalled = true
    }
}
