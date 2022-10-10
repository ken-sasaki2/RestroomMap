//
//  ApplicationBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/29.
//

import Foundation

final class ApplicationBuilder {
    static let shared = ApplicationBuilder()

    private init() {}

    func build() -> AppDelegateController {
        let presenter = LaunchPresenter()
        let dataStore = UserDataStore()
        let repository = UserRepository(dataStore: dataStore)
        let useCase = LaunchUseCase(output: presenter, repository: repository)
        let controller = AppDelegateController(launchUseCaseInput: useCase)

        return controller
    }
}
