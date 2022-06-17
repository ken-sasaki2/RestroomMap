//
//  ATTPermissionRepositoryTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class ATTPermissionRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getAuthorizationStatus() throws {
        let dataStore = MockATTPermissionDataStore()
        let repository = ATTPermissionRepository(dataStore: dataStore)

        let result = repository.getAuthorizationStatus()
        XCTAssertEqual(dataStore.isGetAuthorizationStatusCalled, true)
        XCTAssertEqual(result, .authorized)
    }


    func test_requestAuthorization() async throws {
        let dataStore = MockATTPermissionDataStore()
        let repository = ATTPermissionRepository(dataStore: dataStore)

        await repository.requestAuthorization()
        XCTAssertEqual(dataStore.isRequestAuthorizationCalled, true)
    }
}
