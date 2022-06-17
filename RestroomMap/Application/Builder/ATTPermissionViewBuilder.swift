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
        let dataStore = ATTPermissionDataStore()
        let repository = ATTPermissionRepository(dataStore: dataStore)
        let presenter = ATTPermissionPresenter()
        let useCase = ATTPermissionUseCase(output: presenter, repository: repository)
        let controller = ATTPermissionController(useCaseInput: useCase)
        let view = ATTPermissionView(controller: controller)

        return view
    }
}
