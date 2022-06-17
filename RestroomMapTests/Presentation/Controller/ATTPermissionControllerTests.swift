//
//  ATTPermissionControllerTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class ATTPermissionControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_onNextPegeButtonTapped() throws {
        let useCase = MockATTPermissionUseCase()
        let controler = ATTPermissionController(useCaseInput: useCase)
        
        Task {
            controler.onNextPegeButtonTapped()
            XCTAssertEqual(useCase.isCompleteATTPermissionIfCanCalled, true)
        }
    }
}
