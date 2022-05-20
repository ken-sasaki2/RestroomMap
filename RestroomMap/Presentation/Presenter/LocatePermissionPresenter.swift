//
//  LocatePermissionPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/16.
//

import Foundation

protocol LocatePermissionPresenterinterface {
    func isShowDeniedAlert()
    func openSettingPage()
    func doneLocatePermission()
    func failLocatePermission()
}


final class LocatePermissionPresenter: LocatePermissionPresenterinterface {
    let viewModel: LocatePermissionViewModel


    init(viewModel: LocatePermissionViewModel) {
        self.viewModel = viewModel
    }


    func isShowDeniedAlert() {
        viewModel.isShowDeniedAlert = true
    }


    func openSettingPage() {
        viewModel.openSettingPage()
    }


    func doneLocatePermission() {
        viewModel.doneLocatePermission = true
    }


    func failLocatePermission() {
        viewModel.isShowFailLocatePermissionAlert = true
    }
}
