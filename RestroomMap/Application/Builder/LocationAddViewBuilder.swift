//
//  LocationAddViewBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/20.
//

import Foundation

final class LocationAddViewBuilder {
    static let shared = LocationAddViewBuilder()

    private init() {}

    func build() -> LocationAddView {
        let dataStore = LocationAddDataStore()
        let repository = LocationAddRepository(dataStore: dataStore)
        let presenter = LocationAddPresenter()
        let useCase = LocationAddUseCase(repository: repository, output: presenter)
        let controller = LocationAddController(useCaseInput: useCase)
        let view = LocationAddView(controller: controller)

        return view
    }
}
