//
//  LocatePermissionUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import XCTest

final class LocatePermissionUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_startUpdatingLocationIfCan() throws {
        let locatePermissionRepository = MockLocatePermissionRepository()
        locatePermissionRepository.entity = .restricted
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.startUpdatingLocationIfCan()
        XCTAssertEqual(locatePermissionRepository.isGetAuthorizationStatusCalled, true)
        XCTAssertEqual(output.isStatusDeniedCalled, true)
    }


    func test_actionPerStatus_ステータスがnotDeterminedの場合() {
        let locatePermissionRepository = MockLocatePermissionRepository()
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.actionPerStatus(.notDetermined)
        XCTAssertEqual(locatePermissionRepository.isRequestWhenInUseCalled, true)
        XCTAssertEqual(output.isStatusDeniedCalled, true)
    }


    func test_actionPerStatus_ステータスがrestrictedの場合() {
        let locatePermissionRepository = MockLocatePermissionRepository()
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.actionPerStatus(.restricted)
        XCTAssertEqual(output.isStatusDeniedCalled, true)
    }


    func test_actionPerStatus_ステータスがdeniedの場合() {
        let locatePermissionRepository = MockLocatePermissionRepository()
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.actionPerStatus(.denied)
        XCTAssertEqual(output.isStatusDeniedCalled, true)
    }


    func test_actionPerStatus_ステータスがauthorizedAlwaysの場合() {
        let locatePermissionRepository = MockLocatePermissionRepository()
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.actionPerStatus(.authorizedAlways)
        XCTAssertEqual(locatePermissionRepository.isStartUpdatingLocationCalled, true)
    }


    func test_actionPerStatus_ステータスがauthorizedWhenInUseの場合() {
        let locatePermissionRepository = MockLocatePermissionRepository()
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.actionPerStatus(.authorizedWhenInUse)
        XCTAssertEqual(locatePermissionRepository.isStartUpdatingLocationCalled, true)
    }


    func test_startUpdatingLocation() throws {
        let locatePermissionRepository = MockLocatePermissionRepository()
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.startUpdatingLocation()
        XCTAssertEqual(locatePermissionRepository.isStartUpdatingLocationCalled, true)
    }


    func test_didUpdatedLocation() throws {
        let entity = CurrentLocationEntity(lat: TestConst.lat, lng: TestConst.lng)
        let locatePermissionRepository = MockLocatePermissionRepository()
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.didUpdatedLocation(entity)
        XCTAssertEqual(userRepository.isSaveLocationCalled, true)
        XCTAssertEqual(output.isSuccessLocatePermissionCalled, true)
    }


    func test_didFailWithError() throws {
        let locatePermissionRepository = MockLocatePermissionRepository()
        let userRepository = MockUserRepository()
        let output = MockLocatePermissionUseCaseOutput()
        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: output
        )

        useCase.didFailWithError()
        XCTAssertEqual(output.isFailLocatePermissionCalled, true)
    }
}
