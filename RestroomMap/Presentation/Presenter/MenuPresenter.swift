//
//  MenuPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

protocol MenuPresenterInterface {
    func showShareSheet(model: SharePostModel)
}


final class MenuPresenter: MenuPresenterInterface {
    private let viewModel: MenuViewModel


    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }


    func showShareSheet(model: SharePostModel) {
        viewModel.isShowShareSheet = true
        viewModel.shareText = model.shareText
        viewModel.shareImage = model.shareImage
        viewModel.shareUrl = model.shareUrl
    }
}
