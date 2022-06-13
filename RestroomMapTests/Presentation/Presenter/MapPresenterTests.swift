//
//  MapPresenterTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/05/28.
//

import XCTest

class MapPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_showFocusView() throws {
        let viewModel = MapViewModel()
        let presenter = MapPresenter(viewModel: viewModel)
        presenter.showFocusView()

        XCTAssertEqual(viewModel.isShowFocusView, true)
    }


    func test_hideFocusView() throws {
        let viewModel = MapViewModel()
        let presenter = MapPresenter(viewModel: viewModel)
        presenter.hideFocusView()

        XCTAssertEqual(viewModel.isShowFocusView, false)
    }


    func test_showAddLocationView() throws {
        let viewModel = MapViewModel()
        let presenter = MapPresenter(viewModel: viewModel)
        presenter.showAddLocationView()

        XCTAssertEqual(viewModel.isShowAddLocationView, true)
    }


    func test_showMenuView() throws {
        let viewModel = MapViewModel()
        let presenter = MapPresenter(viewModel: viewModel)
        presenter.showMenuView()

        XCTAssertEqual(viewModel.isShowMenuView, true)
    }


    func test_moveCurrentLocationPoint() throws {
        let viewModel = MapViewModel()
        let model = CurrentLocationModel(lat: TestConst.lat, lng: TestConst.lng)

        let presenter = MapPresenter(viewModel: viewModel)
        presenter.moveCurrentLocationPoint(model: model)

        XCTAssertEqual(viewModel.currentLocation.lat, model.lat)
        XCTAssertEqual(viewModel.currentLocation.lng, model.lng)
    }


    func test_showLocationAlert() throws {
        let viewModel = MapViewModel()
        let presenter = MapPresenter(viewModel: viewModel)
        presenter.showLocationAlert()

        XCTAssertEqual(viewModel.isShowLocationAlert, true)
    }


    func test_showIndicatorView() throws {
        let viewModel = MapViewModel()
        let presenter = MapPresenter(viewModel: viewModel)
        presenter.showIndicatorView()

        XCTAssertEqual(viewModel.isShowIndicatorView, true)
    }


    func test_hideIndicatorView() throws {
        let viewModel = MapViewModel()
        let presenter = MapPresenter(viewModel: viewModel)
        presenter.hideIndicatorView()

        XCTAssertEqual(viewModel.isShowIndicatorView, false)
    }
}
