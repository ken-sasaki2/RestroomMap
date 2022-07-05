//
//  LocationAddPresenterTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/07/05.
//

import XCTest

class LocationAddPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_successAddLocation() throws {
        let viewModel = LocationAddViewModel()
        let presenter = LocationAddPresenter(viewModel: viewModel)

        presenter.successAddLocation()
        XCTAssertEqual(viewModel.isShowIndicatorView, true)
        XCTAssertEqual(viewModel.isShowSuccessSaveLocationAlert, true)
    }


    func test_failAddLocation_statusがerrorの場合() throws {
        let viewModel = LocationAddViewModel()
        let presenter = LocationAddPresenter(viewModel: viewModel)

        presenter.failAddLocation(.error)
        XCTAssertEqual(viewModel.isShowIndicatorView, true)
        XCTAssertEqual(viewModel.isShowFailSaveLocationAlert, true)
    }


    func test_failAddLocation_statusがinValidNameの場合() throws {
        let viewModel = LocationAddViewModel()
        let presenter = LocationAddPresenter(viewModel: viewModel)

        presenter.failAddLocation(.inValidName)
        XCTAssertEqual(viewModel.isShowIndicatorView, true)
        XCTAssertEqual(viewModel.isShowInValidLocationNameAlert, true)
    }


    func test_toggleIndicator() throws {
        let viewModel = LocationAddViewModel()
        let presenter = LocationAddPresenter(viewModel: viewModel)

        presenter.toggleIndicator()
        XCTAssertEqual(viewModel.isShowIndicatorView, true)
    }
}
