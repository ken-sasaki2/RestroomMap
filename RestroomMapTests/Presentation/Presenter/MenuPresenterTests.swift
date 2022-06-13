//
//  MenuPresenterTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/05/28.
//

import XCTest

class MenuPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_showShareSheetView() throws {
        let viewModel = MenuViewModel()
        let model = SharePostModel(shareText: TestConst.shareText, shareImage: TestConst.shareImage, shareUrl: TestConst.shareUrl)

        let presenter = MenuPresenter(viewModel: viewModel)
        presenter.showShareSheetView(model: model)

        XCTAssertEqual(viewModel.isShowShareSheetView, true)
        XCTAssertEqual(viewModel.shareText, model.shareText)
        XCTAssertEqual(viewModel.shareImage, model.shareImage)
        XCTAssertEqual(viewModel.shareUrl, model.shareUrl)
    }


    func test_showInquiryView() throws {
        let viewModel = MenuViewModel()
        let presenter = MenuPresenter(viewModel: viewModel)
        presenter.showInquiryView()

        XCTAssertEqual(viewModel.isShowInquiryView, true)
    }
}
