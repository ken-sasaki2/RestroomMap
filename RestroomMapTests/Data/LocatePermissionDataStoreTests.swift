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

        XCTContext.runActivity(named: "notDeterminedの場合") { _ in
            dataStore.statusEntity = .notDetermined
            let status = dataStore.getAuthorizationStatus()

            XCTAssertEqual(status, .notDetermined)
        }
        XCTContext.runActivity(named: "restrictedの場合") { _ in
            dataStore.statusEntity = .restricted
            let status = dataStore.getAuthorizationStatus()

            XCTAssertEqual(status, .restricted)
        }
        XCTContext.runActivity(named: "deniedの場合") { _ in
            dataStore.statusEntity = .denied
            let status = dataStore.getAuthorizationStatus()

            XCTAssertEqual(status, .denied)
        }
        XCTContext.runActivity(named: "authorizedAlwaysの場合") { _ in
            dataStore.statusEntity = .authorizedAlways
            let status = dataStore.getAuthorizationStatus()

            XCTAssertEqual(status, .authorizedAlways)
        }
        XCTContext.runActivity(named: "authorizedWhenInUseの場合") { _ in
            dataStore.statusEntity = .authorizedWhenInUse
            let status = dataStore.getAuthorizationStatus()

            XCTAssertEqual(status, .authorizedWhenInUse)
        }
        XCTContext.runActivity(named: "unknownの場合") { _ in
            dataStore.statusEntity = .unknown
            let status = dataStore.getAuthorizationStatus()

            XCTAssertEqual(status, .unknown)
        }
    }
}
