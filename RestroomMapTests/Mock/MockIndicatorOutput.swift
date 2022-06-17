//
//  MockIndicatorOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockIndicatorOutput: IndicatorUseCaseOutput {

    var isShowCalled = false
    func show() {
        isShowCalled = true
    }


    var isHideCalled = false
    func hide() {
        isHideCalled = true
    }
}
