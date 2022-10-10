//
//  UserDataStoreTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/04.
//

import XCTest

class UserDataStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_getLaunchCount() throws {
        let dataStore = UserDataStore()
        let expect = dataStore.userDefaults.launchCount + 1

        dataStore.saveLaunchCount()
        let result = dataStore.getLaunchCount()
        XCTAssertEqual(result.launchCount, expect)
    }


    func test_getDeviceId() throws {
        let dataStore = UserDataStore()
        let expects = dataStore.getDeviceId()

        XCTAssertNotNil(expects)
    }
}
