//
//  MapUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/04.
//

import XCTest

class MapUseCaseTests: XCTestCase {

    override func setUpWithError() throws {

    }


    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_showFocusView() throws {
        let output = MockMapUseCaseOutput()
        let mapRepository = MockMapRepository()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        useCase.showFocusView()
        XCTAssertEqual(output.isShowFocusViewCalled, true)
    }


    func test_hideFocusView() throws {
        let output = MockMapUseCaseOutput()
        let mapRepository = MockMapRepository()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        useCase.hideFocusView()
        XCTAssertEqual(output.isHideFocusViewCalled, true)
    }


    func test_showAddLocationViewIfCan_validLocatePermissionの返り値がfalseの場合() throws {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        locatePermissionRepository.entity = .notDetermined
        useCase.showAddLocationViewIfCan()
        XCTAssertEqual(output.isShowLocationAlertCalled, true)
    }


    func test_showAddLocationViewIfCan_validLocatePermissionの返り値がtrueの場合() throws {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        locatePermissionRepository.entity = .authorizedWhenInUse
        useCase.showAddLocationViewIfCan()
        XCTAssertEqual(output.isShowAddLocationViewCalled, true)
    }


    func test_showMenuView() throws {
        let output = MockMapUseCaseOutput()
        let mapRepository = MockMapRepository()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        useCase.showMenuView()
        XCTAssertEqual(output.isShowMenuViewCalled, true)
    }


    func test_getCurrentLocation() throws {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        useCase.getCurrentLocation()
        XCTAssertEqual(output.isMoveCurrentLocationPointCalled, true)
    }


    func test_moveCurrentLocationPointIfCan_validLocatePermissionの返り値がfalseの場合() throws {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        locatePermissionRepository.entity = .notDetermined
        let model = CurrentLocationModel(lat: TestConst.lat, lng: TestConst.lng)
        useCase.moveCurrentLocationPointIfCan(model: model)
        XCTAssertEqual(output.isShowLocationAlertCalled, true)
    }


    func test_moveCurrentLocationPointIfCan_validLocatePermissionの返り値がtrueの場合() throws {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        locatePermissionRepository.entity = .authorizedWhenInUse
        let model = CurrentLocationModel(lat: TestConst.lat, lng: TestConst.lng)
        useCase.moveCurrentLocationPointIfCan(model: model)
        XCTAssertEqual(output.isMoveCurrentLocationPointCalled, true)
    }


    func test_getAuthorizationStatusEntity() throws {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        let result = useCase.getAuthorizationStatusEntity()
        XCTAssertEqual(result, .unknown)
    }


    func test_validLocatePermission_entityがnotDeterminedの場合() {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        let result = useCase.validLocatePermission(entity: .notDetermined)
        XCTAssertEqual(result, false)
    }


    func test_validLocatePermission_entityがrestrictedの場合() {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        let result = useCase.validLocatePermission(entity: .restricted)
        XCTAssertEqual(result, true)
    }


    func test_validLocatePermission_entityがdeniedの場合() {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        let result = useCase.validLocatePermission(entity: .denied)
        XCTAssertEqual(result, false)
    }


    func test_validLocatePermission_entityがauthorizedAlwaysの場合() {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        let result = useCase.validLocatePermission(entity: .authorizedAlways)
        XCTAssertEqual(result, true)
    }


    func test_validLocatePermission_entityがauthorizedWhenInUseの場合() {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        let result = useCase.validLocatePermission(entity: .authorizedWhenInUse)
        XCTAssertEqual(result, true)
    }


    func test_validLocatePermission_entityがunknownの場合() {
        let output = MockMapUseCaseOutput()
        let locatePermissionRepository = MockLocatePermissionRepository()
        let mapRepository = MockMapRepository()
        let useCase = MapUseCase(output: output, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)

        let result = useCase.validLocatePermission(entity: .unknown)
        XCTAssertEqual(result, true)
    }
}
