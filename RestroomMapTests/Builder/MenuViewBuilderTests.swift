//
//  MenuViewBuilderTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/13.
//

import XCTest

final class MenuViewBuilderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_build() throws {
        let view = MenuViewBuilder.shared.build()
        XCTAssertNotNil(view)
    }
}
