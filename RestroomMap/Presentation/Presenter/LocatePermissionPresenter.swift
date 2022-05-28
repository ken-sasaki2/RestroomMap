//
//  LocatePermissionPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/16.
//

import Foundation

protocol LocatePermissionPresenterinterface {
    func showDeniedAlert()
    func doneLocatePermission()
    func failLocatePermission()
}


final class LocatePermissionPresenter: LocatePermissionPresenterinterface {
    let viewModel: LocatePermissionViewModel


    init(viewModel: LocatePermissionViewModel) {
        self.viewModel = viewModel
    }


    func showDeniedAlert() {
        viewModel.isShowDeniedAlert = true
    }


    func doneLocatePermission() {
        viewModel.isDoneLocatePermission = true
    }


    func failLocatePermission() {
        viewModel.isShowFailLocatePermissionAlert = true
    }
}
