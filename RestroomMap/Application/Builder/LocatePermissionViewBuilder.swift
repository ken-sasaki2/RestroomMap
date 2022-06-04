//
//  LocatePermissionViewBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/16.
//

import Foundation

final class LocatePermissionViewBuilder {
    static let shared = LocatePermissionViewBuilder()

    private init() {}

    func build() -> LocatePermissionView {
        let viewModel = LocatePermissionViewModel()

        let view = LocatePermissionView(
            viewModel: viewModel,
            controller: LocatePermissionController(
                useCase: LocatePermissionUseCase(
                    locatePermissionRepository: LocatePermissionRepository(
                        dataStore: LocatePermissionDataStore()
                    ),
                    userRepository: UserRepository(
                        dataStore: UserDataStore()
                    ),
                    locatePermissionPresenter: LocatePermissionPresenter(
                        viewModel: viewModel
                    ),
                    rootViewPresenter: RootViewPresenter()
                )
            )
        )

        return view
    }
}
