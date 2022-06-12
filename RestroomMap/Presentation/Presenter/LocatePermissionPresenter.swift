//
//  LocatePermissionPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/16.
//

import Foundation


final class LocatePermissionPresenter: LocatePermissionPresenterOutput {
    let viewModel: LocatePermissionViewModel


    init(viewModel: LocatePermissionViewModel) {
        self.viewModel = viewModel
    }


    func statusDenied() {
        viewModel.isShowDeniedAlert = true
    }


    func successLocatePermission() {
        RootViewModel.shared.changeRootView(rootView: .tracking)
    }


    func failLocatePermission() {
        viewModel.isShowFailLocatePermissionAlert = true
    }
}
