//
//  ATTPermissionPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation


protocol ATTPermissionPresenterInterface {
    func doneATTPermission()
}


final class ATTPermissionPresenter: ATTPermissionPresenterInterface {
    let viewModel: ATTPermissionViewModel


    init(viewModel: ATTPermissionViewModel) {
        self.viewModel = viewModel
    }

    func doneATTPermission() {
        viewModel.isDoneATTPermission = true
    }
}
