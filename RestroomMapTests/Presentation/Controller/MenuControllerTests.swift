//
//  MenuControllerTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class MenuControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_onShareButtonTapped() throws {
        let pinTypeUseCase = MockPinTypeUseCase()
        let reviewUseCase = MockReviewUseCase()
        let shareUseCase = MockShareUseCase()
        let inquiryUseCase = MockInquiryUseCase()
        let billingUseCase = MockBillingUseCase()
        let controller = MenuController(
            pinTypeUseCaseInput: pinTypeUseCase,
            reviewUseCaseInput: reviewUseCase,
            shareUseCaseInput: shareUseCase,
            inquiryUseCaseInput: inquiryUseCase,
            billingUseCaseInput: billingUseCase
        )

        controller.onShareButtonTapped()
        XCTAssertEqual(shareUseCase.isShowShareSheetViewCalled, true)
    }


    func test_onReviewButtontapped() throws {
        let pinTypeUseCase = MockPinTypeUseCase()
        let reviewUseCase = MockReviewUseCase()
        let shareUseCase = MockShareUseCase()
        let inquiryUseCase = MockInquiryUseCase()
        let billingUseCase = MockBillingUseCase()
        let controller = MenuController(
            pinTypeUseCaseInput: pinTypeUseCase,
            reviewUseCaseInput: reviewUseCase,
            shareUseCaseInput: shareUseCase,
            inquiryUseCaseInput: inquiryUseCase,
            billingUseCaseInput: billingUseCase
        )

        controller.onReviewButtontapped()
        XCTAssertEqual(reviewUseCase.isRequestReviewCalled, true)
    }


    func test_onInquiryButtonTapped() throws {
        let pinTypeUseCase = MockPinTypeUseCase()
        let reviewUseCase = MockReviewUseCase()
        let shareUseCase = MockShareUseCase()
        let inquiryUseCase = MockInquiryUseCase()
        let billingUseCase = MockBillingUseCase()
        let controller = MenuController(
            pinTypeUseCaseInput: pinTypeUseCase,
            reviewUseCaseInput: reviewUseCase,
            shareUseCaseInput: shareUseCase,
            inquiryUseCaseInput: inquiryUseCase,
            billingUseCaseInput: billingUseCase
        )

        controller.onInquiryButtonTapped()
        XCTAssertEqual(inquiryUseCase.isShowInquiryViewCalled, true)
    }
}
