//
//  MockReviewUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockReviewUseCase: ReviewUseCaseInput {

    var isRequestReviewCalled = false
    func requestReview() {
        isRequestReviewCalled = true
    }
}
