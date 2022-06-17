//
//  MockInquiryUseCaseOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/15.
//

import Foundation

final class MockInquiryUseCaseOutput: InquiryUseCaseOutput {

    var isShowInquiryViewCalled = false
    func showInquiryView() {
        isShowInquiryViewCalled = true
    }
}
