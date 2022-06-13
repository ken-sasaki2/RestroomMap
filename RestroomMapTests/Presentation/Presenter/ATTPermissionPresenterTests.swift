//
//  ATTPermissionPresenterTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/03.
//

import XCTest

class ATTPermissionPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_completeATTPermission() throws {
        let shared = RootViewModel.shared
        shared.changeRootView(rootView: .map)
        XCTAssertEqual(shared.rootView, .map)
    }
}
