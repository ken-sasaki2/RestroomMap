//
//  MapDataStoreTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/05/20.
//

import XCTest

class MapDataStoreTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_getCurrentLocationEntity() throws {
        let dataStore = MapDataStore()
        dataStore.userDefaults.lat = 35.65139
        dataStore.userDefaults.lng = 139.63679

        let result = dataStore.getCurrentLocationEntity()
        XCTAssertEqual(result.lat, 35.65139)
        XCTAssertEqual(result.lng, 139.63679)
    }
}
