//
//  RegistedDataViewBuilderTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import XCTest

class RegistedDataViewBuilderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testE_build() throws {
        let outputModel = TestConst.locationFetchOutputModel[0]
        let view = RegistedDataViewBuilder.shared.build(outputModel)

        XCTAssertNotNil(view)
    }
}
