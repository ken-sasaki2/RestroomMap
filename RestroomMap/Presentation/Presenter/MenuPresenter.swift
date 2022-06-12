//
//  MenuPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation


final class MenuPresenter {
    private let viewModel: MenuViewModel

    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }
}


extension MenuPresenter: PinTypeUseCaseOutput {

}


extension MenuPresenter: ShareUseCaseOutput {
    func showShareSheetView(model: SharePostModel) {
        viewModel.isShowShareSheetView = true
        viewModel.shareText = model.shareText
        viewModel.shareImage = model.shareImage
        viewModel.shareUrl = model.shareUrl
    }
}


extension MenuPresenter: InquiryUseCaseOutput {
    func showInquiryView() {
        viewModel.isShowInquiryView = true
    }
}


extension MenuPresenter: BillingUseCaseOutput {

}
