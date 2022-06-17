//
//  LocatePermissionViewBuilderTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/13.
//

import XCTest

final class LocatePermissionViewBuilderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_build() throws {
        let view = LocatePermissionViewBuilder.shared.build()
        XCTAssertNotNil(view)
    }
}
