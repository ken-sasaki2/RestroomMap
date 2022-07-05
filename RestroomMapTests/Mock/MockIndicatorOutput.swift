//
//  MockIndicatorOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockIndicatorOutput: IndicatorUseCaseOutput {

    var isToggleIndicatorCalled = false
    func toggleIndicator() {
        isToggleIndicatorCalled = true
    }
}
