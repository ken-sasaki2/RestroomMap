//
//  IndicatorUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import XCTest

final class IndicatorUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_toggleIndicator() throws {
        let output = MockIndicatorOutput()
        let useCase = IndicatorUseCase(output: output)

        useCase.toggleIndicator()
        XCTAssertEqual(output.isToggleIndicatorCalled, true)
    }
}
