//
//  ReviewUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import StoreKit

protocol ReviewUseCaseInterface {
    func requestReview()
}

final class ReviewUseCase: ReviewUseCaseInterface {
    private let presenter: MenuPresenter


    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }


    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
