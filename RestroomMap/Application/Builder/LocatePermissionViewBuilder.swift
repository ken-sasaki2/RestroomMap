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
        let locatePermissionDataStore = LocatePermissionDataStore()
        let userDataStore = UserDataStore()
        let locatePermissionRepository = LocatePermissionRepository(dataStore: locatePermissionDataStore)
        let userRepository = UserRepository(dataStore: userDataStore)

        let viewModel = LocatePermissionViewModel()
        let presenter = LocatePermissionPresenter(viewModel: viewModel)

        let useCase = LocatePermissionUseCase(
            locatePermissionRepository: locatePermissionRepository,
            userRepository: userRepository,
            output: presenter
        )

        let controller = LocatePermissionController(useCaseInput: useCase)
        let view = LocatePermissionView(viewModel: viewModel, controller: controller)

        return view
    }
}
