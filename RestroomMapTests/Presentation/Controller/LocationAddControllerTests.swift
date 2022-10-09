//
//  LocationAddControllerTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/28.
//

import XCTest

class LocationAddControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_onAddButtonTapped() throws {
        let indicatorUseCase = MockIndicatorUseCase()
        let locationAddUseCase = MockLocationAddUseCase()
        let controller = LocationAddController(useCaseInput: locationAddUseCase, indicatorUseCaseInput: indicatorUseCase)

        controller.onAddButtonTapped(
            lat: TestConst.lat,
            lng: TestConst.lng,
            name: "テスト",
            isOpen24Hour: false,
            openDate: Date(),
            closeDate: Date(),
            holiday: "テストテストテスト",
            isWesternStyle: true,
            isJapaneseStyle: true,
            isPublic: true,
            isByGender: true,
            isWashlet: true,
            isMultipurpose: true,
            isWheelchair: true,
            isDiaper: true,
            isBed: true,
            isPowderRoom: true,
            isParking: true,
            memo: "テストテストテストテストテスト",
            deviceId: TestConst.deviceId
        )
        XCTAssertEqual(locationAddUseCase.isAddLocationCalled, true)
    }


    func test_showIndicator() throws {
        let indicatorUseCase = MockIndicatorUseCase()
        let locationAddUseCase = MockLocationAddUseCase()
        let controller = LocationAddController(useCaseInput: locationAddUseCase, indicatorUseCaseInput: indicatorUseCase)

        controller.toggleIndicator()
        XCTAssertEqual(indicatorUseCase.isToggleIndicatorCalled, true)
    }


    func test_getDeviceId() throws {
        let locationAddUseCase = MockLocationAddUseCase()
        let indicatorUseCase = MockIndicatorUseCase()
        let controller = LocationAddController(useCaseInput: locationAddUseCase, indicatorUseCaseInput: indicatorUseCase)

        controller.getDeviceId()
        XCTAssertEqual(locationAddUseCase.isGetDeviceIdCalled, true)
    }
}
