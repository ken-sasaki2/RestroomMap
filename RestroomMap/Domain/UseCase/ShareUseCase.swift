//
//  ShareUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import Foundation

protocol ShareUseCaseInterface {
    func showShareSheet(model: SharePostModel)
}


final class ShareUseCase: ShareUseCaseInterface {
    private let presenter: MenuPresenter

    
    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }


    func showShareSheet(model: SharePostModel) {
        presenter.showShareSheet(model: model)
    }
}
