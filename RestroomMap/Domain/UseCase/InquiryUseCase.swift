//
//  InquiryUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import Foundation

protocol InquiryUseCaseInterface {
    func showInquiryView()
}


final class InquiryUseCase: InquiryUseCaseInterface {
    private let presenter: MenuPresenter


    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }


    func showInquiryView() {
        presenter.showInquiryView()
    }
}
