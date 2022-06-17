//
//  ATTPermissionPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/12.
//

import Foundation


final class ATTPermissionPresenter: ATTPermissionUseCaseOutput {
    func completeATTPermission() {
        RootViewModel.shared.changeRootView(rootView: .map)
    }
}
