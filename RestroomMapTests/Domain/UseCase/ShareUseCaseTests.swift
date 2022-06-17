//
//  ShareUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/04.
//

import XCTest

class ShareUseCaseTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_showShareSheetView() throws {
        let output = MockShareUseCaseOutput()
        let useCase = ShareUseCase(output: output)
        let model = SharePostModel(shareText: TestConst.shareText, shareImage: TestConst.shareUrl, shareUrl: TestConst.shareUrl)

        useCase.showShareSheetView(model: model)
        XCTAssertEqual(output.isShowShareSheetViewCalled, true)
    }
}
