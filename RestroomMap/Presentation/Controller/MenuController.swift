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
}
