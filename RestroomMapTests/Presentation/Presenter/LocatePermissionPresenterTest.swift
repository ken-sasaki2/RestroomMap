//
//  LocatePermissionPresenterTest.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/05/28.
//

import XCTest

class LocatePermissionPresenterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_statusDenied() throws {
        let viewModel = LocatePermissionViewModel()
        let presenter = LocatePermissionPresenter(viewModel: viewModel)

        presenter.statusDenied()
        XCTAssertEqual(viewModel.isShowDeniedAlert, true)
    }


    func test_failLocatePermission() throws {
        let viewModel = LocatePermissionViewModel()
        let presenter = LocatePermissionPresenter(viewModel: viewModel)

        presenter.failLocatePermission()
        XCTAssertEqual(viewModel.isShowFailLocatePermissionAlert, true)
    }
}
