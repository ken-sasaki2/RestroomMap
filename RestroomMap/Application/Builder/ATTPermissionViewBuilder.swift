//
//  ATTPermissionViewBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation

final class ATTPermissionViewBuilder {
    static let shared = ATTPermissionViewBuilder()

    private init() {}

    func build() -> ATTPermissionView {
        let viewModel = ATTPermissionViewModel()
        let presenter = ATTPermissionPresenter(viewModel: viewModel)
        let dataStore = ATTPermissionDataStore()
        let repository = ATTPermissionRepository(dataStore: dataStore)
        let useCase = ATTPermissionUseCase(output: presenter, repository: repository)
        let controller = ATTPermissionController(useCaseInput: useCase)
        let view = ATTPermissionView(viewModel: viewModel, controller: controller)

        return view
    }
}
