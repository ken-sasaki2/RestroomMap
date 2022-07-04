//
//  LocationAddViewBuilderTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/28.
//

import XCTest

class LocationAddViewBuilderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_build() throws {
        let view = LocationAddViewBuilder.shared.build(lat: TestConst.lat, lng: TestConst.lng)
        XCTAssertNotNil(view)
    }
}
