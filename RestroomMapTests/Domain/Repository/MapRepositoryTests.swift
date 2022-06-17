//
//  MapRepositoryTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class MapRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_getCurrentLocationEntity() throws {
        let dataStore = MockMapDataStore()
        let repository = MapRepository(dataStore: dataStore)

        let result = repository.getCurrentLocationEntity()
        XCTAssertEqual(result.lat, 35.65139)
        XCTAssertEqual(result.lng, 139.63679)
    }
}
