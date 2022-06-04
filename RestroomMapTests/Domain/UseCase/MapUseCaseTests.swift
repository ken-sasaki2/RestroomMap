//
//  MapUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/04.
//

import XCTest

class MapUseCaseTests: XCTestCase {
    private var useCase: MapUseCase?
    private let viewModel = MapViewModel()

    override func setUpWithError() throws {
        useCase = MapUseCase(
            presenter: MapPresenter(
                viewModel: viewModel
            ),
            mapRepository: MapRepository(
                dataStore: MapDataStore()
            ),
            locatePermissionRepository: LocatePermissionRepository(
                dataStore: LocatePermissionDataStore()
            )
        )
    }

    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_getAuthorizationStatusEntity() throws {
        let status = useCase?.getAuthorizationStatusEntity()
        XCTAssert(status != nil)
    }

    
    func test_validLocatePermission() throws {
        XCTContext.runActivity(named: "notDeterminedの場合") { _ in
            let result = useCase?.validLocatePermission(entity: .notDetermined)
            XCTAssertEqual(result, false)
        }
        XCTContext.runActivity(named: "restrictedの場合") { _ in
            let result = useCase?.validLocatePermission(entity: .restricted)
            XCTAssertEqual(result, true)
        }
        XCTContext.runActivity(named: "deniedの場合") { _ in
            let result = useCase?.validLocatePermission(entity: .denied)
            XCTAssertEqual(result, false)
        }
        XCTContext.runActivity(named: "authorizedAlwaysの場合") { _ in
            let result = useCase?.validLocatePermission(entity: .authorizedAlways)
            XCTAssertEqual(result, true)
        }
        XCTContext.runActivity(named: "authorizedWhenInUseの場合") { _ in
            let result = useCase?.validLocatePermission(entity: .authorizedWhenInUse)
            XCTAssertEqual(result, true)
        }
        XCTContext.runActivity(named: "unknownの場合") { _ in
            let result = useCase?.validLocatePermission(entity: .unknown)
            XCTAssertEqual(result, true)
        }
    }
}
