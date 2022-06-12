//
//  InquiryUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import Foundation

protocol InquiryUseCaseInput {
    func show()
}


protocol InquiryUseCaseOutput {
    func showInquiryView()
}


final class InquiryUseCase: InquiryUseCaseInput {
    private let output: InquiryUseCaseOutput


    init(output: InquiryUseCaseOutput) {
        self.output = output
    }


    func show() {
        output.showInquiryView()
    }
}
