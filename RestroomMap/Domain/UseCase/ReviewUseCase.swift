//
//  ReviewUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import StoreKit

protocol ReviewUseCaseInput {
    func requestReview()
}


final class ReviewUseCase: ReviewUseCaseInput {

    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
