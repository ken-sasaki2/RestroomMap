//
//  ShareUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/04.
//

import XCTest

class ShareUseCaseTests: XCTestCase {
    private var useCase: ShareUseCase?
    private let viewModel = MenuViewModel()

    override func setUpWithError() throws {
        useCase = ShareUseCase(presenter: MenuPresenter(viewModel: viewModel))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_showShareSheetView() throws {
        let model = SharePostModel(shareText: TestConst.shareText, shareImage: TestConst.shareUrl, shareUrl: TestConst.shareUrl)
        useCase?.showShareSheetView(model: model)

        XCTAssertEqual(viewModel.isShowShareSheetView, true)
        XCTAssertEqual(viewModel.shareText, model.shareText)
        XCTAssertEqual(viewModel.shareImage, model.shareImage)
        XCTAssertEqual(viewModel.shareUrl, model.shareUrl)
    }
}
