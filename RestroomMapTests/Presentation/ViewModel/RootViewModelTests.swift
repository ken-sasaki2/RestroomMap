//
//  RootViewModelTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/03.
//

import XCTest

class RootViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_changeRootView_rootViewがlocationの場合() throws {
        let viewModel = RootViewModel.shared
        viewModel.changeRootView(rootView: .location)

        XCTAssert(viewModel.rootView == .location)
    }


    func test_changeRootView_rootViewがmapの場合() throws {
        let viewModel = RootViewModel.shared
        viewModel.changeRootView(rootView: .map)

        XCTAssert(viewModel.rootView == .map)
    }


    func test_changeRootView_rootViewがtrackingの場合() throws {
        let viewModel = RootViewModel.shared
        viewModel.changeRootView(rootView: .tracking)

        XCTAssert(viewModel.rootView == .tracking)
    }
}
