//
//  MockInquiryUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockInquiryUseCase: InquiryUseCaseInput {

    var isShowInquiryViewCalled = false
    func showInquiryView() {
        isShowInquiryViewCalled = true
    }
}
