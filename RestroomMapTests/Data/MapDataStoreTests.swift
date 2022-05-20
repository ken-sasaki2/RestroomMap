//
//  MapDataStoreTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/05/20.
//

import XCTest

class MapDataStoreTests: XCTestCase {

    override func setUpWithError() throws {
        let userDataStore = UserDataStore()
        let entity = CurrentLocationEntity(lat: 35.65139, lng: 139.63679)
        userDataStore.saveLocation(entity: entity)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getCurrentLocationEntity() throws {
        let mapDataStore = MapDataStore()
        let result = mapDataStore.getCurrentLocationEntity()

        XCTAssertEqual(result.lat, 35.65139)
        XCTAssertEqual(result.lng, 139.63679)
    }
}
