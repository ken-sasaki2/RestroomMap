//
//  CurrentLocationModelTranslatorTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/05/20.
//

import XCTest

class CurrentLocationModelTranslatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_translate() throws {
        let input = CurrentLocationEntity(lat: 35.65139, lng: 139.63679)
        let result = CurrentLocationModelTranslator.translate(entity: input)
        let expect = CurrentLocationModel(lat: 35.65139, lng: 139.63679)

        XCTAssertEqual(result.lat, expect.lat)
        XCTAssertEqual(result.lng, expect.lng)
    }
}
