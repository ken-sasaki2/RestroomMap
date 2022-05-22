//
//  MenuController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

final class MenuController {
    private let pinTypeUseCase: PinTypeUseCaseInterface
    private let reviewUseCase: ReviewUseCaseInterface
    private let shareUseCase: ShareUseCaseInterface
    private let inquiryUseCase: InquiryUseCaseInterface
    private let billingUseCase: BillingUseCaseInterface


    init(
        pinTypeUseCase: PinTypeUseCaseInterface,
        reviewUseCase: ReviewUseCaseInterface,
        shareUseCase: ShareUseCaseInterface,
        inquiryUseCase: InquiryUseCaseInterface,
        billingUseCase: BillingUseCaseInterface
    ) {
        self.pinTypeUseCase = pinTypeUseCase
        self.reviewUseCase = reviewUseCase
        self.shareUseCase = shareUseCase
        self.inquiryUseCase = inquiryUseCase
        self.billingUseCase = billingUseCase
    }

    func onShareButtonTapped() {
        // refactorTODO: const化する
        let shareText = "公衆トイレ共有アプリ"
        let shareUrl = "https://qiita.com/ken_sasaki2"
        let shareImage = "focus"

        let model = SharePostModel(shareText: shareText, shareImage: shareImage, shareUrl: shareUrl)
        shareUseCase.onShareButtonTapped(model: model)
    }
}
