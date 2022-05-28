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

        let view = ATTPermissionView(
            viewModel: viewModel,
            controller: ATTPermissionController(
                useCase: ATTPermissionUseCase(
                    repository: ATTPermissionRepository(
                        dataStore: ATTPermissionDataStore()
                    ),
                    presenter: ATTPermissionPresenter(
                        viewModel: viewModel
                    )
                )
            )
        )

        return view
    }
}
