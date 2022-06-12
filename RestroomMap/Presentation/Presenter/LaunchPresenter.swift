//
//  RootViewPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import Foundation


final class LaunchPresenter: UserUseCaseOutput {

    func showLocatePermissionView() {
        RootViewModel.shared.changeRootView(rootView: .location)
    }
}
