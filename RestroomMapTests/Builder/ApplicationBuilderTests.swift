//
//  ApplicationBuilderTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/12.
//

import XCTest

final class ApplicationBuilderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_build() throws {
        let result = ApplicationBuilder.shared.build()
        XCTAssertNotNil(result)
    }
}
