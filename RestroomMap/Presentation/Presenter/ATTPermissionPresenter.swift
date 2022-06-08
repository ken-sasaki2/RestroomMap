//
//  ATTPermissionPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation

final class ATTPermissionPresenter: ATTPermissionUseCaseOutput {
    let viewModel: ATTPermissionViewModel


    init(viewModel: ATTPermissionViewModel) {
        self.viewModel = viewModel
    }


    func completeATTPermission() {
        viewModel.isDoneATTPermission = true
    }
}
