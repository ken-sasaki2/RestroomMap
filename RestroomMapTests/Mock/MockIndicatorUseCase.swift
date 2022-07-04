//
//  MockIndicatorUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockIndicatorUseCase: IndicatorUseCaseInput {
    
    var isToggleIndicatorCalled = false
    func toggleIndicator() {
        isToggleIndicatorCalled = true
    }
}
