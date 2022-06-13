//
//  MenuController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

final class MenuController {
    private let pinTypeUseCaseInput: PinTypeUseCaseInput
    private let reviewUseCaseInput: ReviewUseCaseInput
    private let shareUseCaseInput: ShareUseCaseInput
    private let inquiryUseCaseInput: InquiryUseCaseInput
    private let billingUseCaseInput: BillingUseCaseInput


    init(
        pinTypeUseCaseInput: PinTypeUseCaseInput,
        reviewUseCaseInput: ReviewUseCaseInput,
        shareUseCaseInput: ShareUseCaseInput,
        inquiryUseCaseInput: InquiryUseCaseInput,
        billingUseCaseInput: BillingUseCaseInput
    ) {
        self.pinTypeUseCaseInput = pinTypeUseCaseInput
        self.reviewUseCaseInput = reviewUseCaseInput
        self.shareUseCaseInput = shareUseCaseInput
        self.inquiryUseCaseInput = inquiryUseCaseInput
        self.billingUseCaseInput = billingUseCaseInput
    }

    func onShareButtonTapped() {
        let model = SharePostModel(
            shareText: Const.shareText,
            shareImage: Const.shareImage,
            shareUrl: Const.shareUrl
        )

        shareUseCaseInput.showShareSheetView(model: model)
    }

    func onReviewButtontapped() {
        reviewUseCaseInput.requestReview()
    }


    func onInquiryButtonTapped() {
        inquiryUseCaseInput.showInquiryView()
    }
}
