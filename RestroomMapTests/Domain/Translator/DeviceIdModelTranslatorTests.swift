//
//  DeviceIdModelTranslatorTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/09.
//

import XCTest

class DeviceIdModelTranslatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_translate() throws {
        let entity = DeviceIdEntity(deviceId: TestConst.deviceId)
        let result = DeviceIdModelTranslator.translate(entity)
        let expect = DeviceIdModel(deviceId: TestConst.deviceId)

        XCTAssertEqual(result.deviceId, expect.deviceId)
    }
}
