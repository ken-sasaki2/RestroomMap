//
//  RegistedDataControllerTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import XCTest

class RegistedDataControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getDeviceId() throws {
        let registedDataUseCaseInput = MockRegistedDataUseCase()
        let locationDeleteUseCaseInput = MockLocationDeleteUseCase()
        let indicatorUseCaseInput = MockIndicatorUseCase()
        let controller = RegistedDataController(registedDataUseCaseInput: registedDataUseCaseInput, locationDeleteUseCaseInput: locationDeleteUseCaseInput, indicatorUseCaseInput: indicatorUseCaseInput)

        controller.getDeviceId()
        XCTAssertEqual(registedDataUseCaseInput.isGetDeviceCalled, true)
    }


    func test_deleteLocation() throws {
        let registedDataUseCaseInput = MockRegistedDataUseCase()
        let locationDeleteUseCaseInput = MockLocationDeleteUseCase()
        let indicatorUseCaseInput = MockIndicatorUseCase()
        let controller = RegistedDataController(registedDataUseCaseInput: registedDataUseCaseInput, locationDeleteUseCaseInput: locationDeleteUseCaseInput, indicatorUseCaseInput: indicatorUseCaseInput)

        Task {
            controller.deleteLocation(TestConst.documentId)
            XCTAssertEqual(locationDeleteUseCaseInput.isDeleteLocationCalled, true)
        }

    }


    func test_toggleIndicator() throws {
        let registedDataUseCaseInput = MockRegistedDataUseCase()
        let locationDeleteUseCaseInput = MockLocationDeleteUseCase()
        let indicatorUseCaseInput = MockIndicatorUseCase()
        let controller = RegistedDataController(registedDataUseCaseInput: registedDataUseCaseInput, locationDeleteUseCaseInput: locationDeleteUseCaseInput, indicatorUseCaseInput: indicatorUseCaseInput)

        controller.toggleIndicator()
        XCTAssertEqual(indicatorUseCaseInput.isToggleIndicatorCalled, true)
    }
}
