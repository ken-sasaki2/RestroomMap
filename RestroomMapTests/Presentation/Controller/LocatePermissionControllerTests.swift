//
//  LocatePermissionControllerTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class LocatePermissionControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_onNextPageButtonTapped() throws {
        let useCase = MockLocatePermissionUseCase()
        let controller = LocatePermissionController(useCaseInput: useCase)

        controller.onNextPageButtonTapped()
        XCTAssertEqual(useCase.isStartUpdatingLocationIfCanCalled, true)
    }


    func test_onGoToSettingPageButtonTapped() throws {
        let useCase = MockLocatePermissionUseCase()
        let controller = LocatePermissionController(useCaseInput: useCase)

        controller.onGoToSettingPageButtonTapped()
        XCTAssertEqual(useCase.isOpenSettingPageCaled, true)
    }
}
