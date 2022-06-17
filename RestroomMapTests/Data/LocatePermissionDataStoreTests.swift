//
//  LocatePermissionDataStoreTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/04.
//

import XCTest

class LocatePermissionDataStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_getAuthorizationStatus() throws {
        let dataStore = LocatePermissionDataStore()

        dataStore.statusEntity = .authorizedAlways
        let result = dataStore.getAuthorizationStatus()
        XCTAssertEqual(result, .authorizedAlways)
    }


    func test_requestWhenInUse() throws {
        let dataStore = LocatePermissionDataStore()

        let exp = XCTestExpectation(description: "wait async.")

        dataStore.requestWhenInUse { _ in
            XCTAssertNotNil(dataStore.callback)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10.0)
    }
}
