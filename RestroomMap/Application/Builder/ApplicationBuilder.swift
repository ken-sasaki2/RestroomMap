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
        let mapViewModel = MapViewModel()
        let controller = AppDelegateController(
            userUseCase: UserUseCase(
                repository: UserRepository(
                    dataStore: UserDataStore()
                ),
                mapPresenter: MapPresenter(
                    viewModel: mapViewModel)
            )
        )

        return controller
    }
}
