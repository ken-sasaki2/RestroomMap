//
//  MenuPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

protocol MenuPresenterInterface {
    func showShareSheetView(model: SharePostModel)
}


final class MenuPresenter: MenuPresenterInterface {
    private let viewModel: MenuViewModel


    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }


    func showShareSheetView(model: SharePostModel) {
        viewModel.isShowShareSheetView = true
        viewModel.shareText = model.shareText
        viewModel.shareImage = model.shareImage
        viewModel.shareUrl = model.shareUrl
    }


    func showInquiryView() {
        viewModel.isShowInquiryView = true
    }
}
