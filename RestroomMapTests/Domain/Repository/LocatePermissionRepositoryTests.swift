//
//  LocatePermissionRepositoryTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class LocatePermissionRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_getAuthorizationStatus() throws {
        let dataStore = LocatePermissionDataStore()
        let repository = LocatePermissionRepository(dataStore: dataStore)

        dataStore.statusEntity = .authorizedWhenInUse
        let result = repository.getAuthorizationStatus()
        XCTAssertEqual(result, .authorizedWhenInUse)
    }


    func test_requestWhenInUse() throws {
        let dataStore = LocatePermissionDataStore()
        let repository = LocatePermissionRepository(dataStore: dataStore)

        let exp = XCTestExpectation(description: "wait async.")

        dataStore.statusEntity = .authorizedWhenInUse
        repository.requestWhenInUse { entity in
            XCTAssertEqual(entity, .authorizedWhenInUse)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10.0)
    }


    func test_startUpdatingLocation() throws {
        let dataStore = MockLocatePermissionDataStore()
        let repository = LocatePermissionRepository(dataStore: dataStore)

        repository.startUpdatingLocation()
        XCTAssertEqual(dataStore.isStartUpdatingLocationCalled, true)
    }
}
