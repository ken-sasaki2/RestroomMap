//
//  AppDelegateControllerTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class AppDelegateControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_saveLaunchCount() throws {
        let useCase = MockLaunchUseCase()
        let controller = AppDelegateController(launchUseCaseInput: useCase)

        controller.saveLaunchCount()
        XCTAssertEqual(useCase.isSaveLaunchCountCalled, true)
    }


    func test_ActionPerFirstLaunchIfCan() throws {
        let useCase = MockLaunchUseCase()
        let controller = AppDelegateController(launchUseCaseInput: useCase)

        controller.actionPerFirstLaunchIfCan()
        XCTAssertEqual(useCase.isActionPerFirstlaunchIfCan, true)
    }
}
