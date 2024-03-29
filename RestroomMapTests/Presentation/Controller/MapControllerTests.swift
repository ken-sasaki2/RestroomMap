//
//  MapControllerTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class MapControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_onPlusButtonTapped() throws {
        let mapUseCase = MockMapUseCase()
        let indicatorUseCase = MockIndicatorUseCase()
        let locationFetchUseCase = MockLocationFetchUseCase()
        let controller = MapController(mapUseCaseInput: mapUseCase, indicatorUseCaseInput: indicatorUseCase, locationFetchUseCaseInput: locationFetchUseCase)

        controller.onPlusButtonTapped()
        XCTAssertEqual(mapUseCase.isShowFocusViewCalled, true)
    }


    func test_onCancelAddLocationButtonTapped() throws {
        let mapUseCase = MockMapUseCase()
        let indicatorUseCase = MockIndicatorUseCase()
        let locationFetchUseCase = MockLocationFetchUseCase()
        let controller = MapController(mapUseCaseInput: mapUseCase, indicatorUseCaseInput: indicatorUseCase, locationFetchUseCaseInput: locationFetchUseCase)

        controller.onCancelAddLocationButtonTapped()
        XCTAssertEqual(mapUseCase.isHideFocusViewCalled, true)
    }


    func test_onAddLocationButtonTapped() throws {
        let mapUseCase = MockMapUseCase()
        let indicatorUseCase = MockIndicatorUseCase()
        let locationFetchUseCase = MockLocationFetchUseCase()
        let controller = MapController(mapUseCaseInput: mapUseCase, indicatorUseCaseInput: indicatorUseCase, locationFetchUseCaseInput: locationFetchUseCase)

        controller.onAddLocationButtonTapped()
        XCTAssertEqual(mapUseCase.isShowAddLocationViewIfCanCalled, true)
    }


    func test_onLocationButtonTapped() throws {
        let mapUseCase = MockMapUseCase()
        let indicatorUseCase = MockIndicatorUseCase()
        let locationFetchUseCase = MockLocationFetchUseCase()
        let controller = MapController(mapUseCaseInput: mapUseCase, indicatorUseCaseInput: indicatorUseCase, locationFetchUseCaseInput: locationFetchUseCase)

        controller.onLocationButtonTapped()
        XCTAssertEqual(mapUseCase.isGetCurrentLocationCalled, true)
    }


    func test_onMenuButtonTapped() throws {
        let mapUseCase = MockMapUseCase()
        let indicatorUseCase = MockIndicatorUseCase()
        let locationFetchUseCase = MockLocationFetchUseCase()
        let controller = MapController(mapUseCaseInput: mapUseCase, indicatorUseCaseInput: indicatorUseCase, locationFetchUseCaseInput: locationFetchUseCase)

        controller.onMenuButtonTapped()
        XCTAssertEqual(mapUseCase.isShowMenuViewCalled, true)
    }


    func test_toggleIndicator() throws {
        let mapUseCase = MockMapUseCase()
        let indicatorUseCase = MockIndicatorUseCase()
        let locationFetchUseCase = MockLocationFetchUseCase()
        let controller = MapController(mapUseCaseInput: mapUseCase, indicatorUseCaseInput: indicatorUseCase, locationFetchUseCaseInput: locationFetchUseCase)

        controller.toggleIndicator()
        XCTAssertEqual(indicatorUseCase.isToggleIndicatorCalled, true)
    }


    func test_fetchLocation() throws {
        let mapUseCase = MockMapUseCase()
        let indicatorUseCase = MockIndicatorUseCase()
        let locationFetchUseCase = MockLocationFetchUseCase()
        let controller = MapController(mapUseCaseInput: mapUseCase, indicatorUseCaseInput: indicatorUseCase, locationFetchUseCaseInput: locationFetchUseCase)

        controller.fetchLocation()
        XCTAssertEqual(locationFetchUseCase.isFetchLocationCalled, true)
    }
}
