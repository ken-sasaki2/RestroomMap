//
//  RegistedDataPresenterTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import XCTest

class RegistedDataPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_setDeviceId() throws {
        let viewModel = RegistedDataViewModel()
        let presenter = RegistedDataPresenter(viewModel: viewModel)
        let model = DeviceIdModel(deviceId: TestConst.deviceId)

        presenter.setDeviceId(model)
        XCTAssertEqual(model.deviceId, viewModel.deviceId)
    }


    func test_successDeleteLocation() throws {
        let viewModel = RegistedDataViewModel()
        let presenter = RegistedDataPresenter(viewModel: viewModel)

        presenter.successDeleteLocation()
        XCTAssertEqual(viewModel.successDeleteLocation, true)
    }


    func test_failDeleteLocation() throws {
        let viewModel = RegistedDataViewModel()
        let presenter = RegistedDataPresenter(viewModel: viewModel)

        presenter.failDeleteLocation()
        XCTAssertEqual(viewModel.failDeleteLocation, true)
    }


    func test_toggleIndicator() throws {
        let viewModel = RegistedDataViewModel()
        let presenter = RegistedDataPresenter(viewModel: viewModel)

        presenter.toggleIndicator()
        XCTAssertEqual(viewModel.isShowIndicatorView, true)
    }
}
