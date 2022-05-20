//
//  MenuPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

protocol MenuPresenterInterface {

}


final class MenuPresenter: MenuPresenterInterface {
    private let viewModel: MenuViewModel


    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }
}
