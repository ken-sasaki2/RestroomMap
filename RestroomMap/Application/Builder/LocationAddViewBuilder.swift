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

    func build(lat: Double, lng: Double) -> LocationAddView {
        let dataStore = LocationAddDataStore()
        let repository = LocationAddRepository(dataStore: dataStore)

        let viewModel = LocationAddViewModel()
        let presenter = LocationAddPresenter(viewModel: viewModel)
        let useCase = LocationAddUseCase(repository: repository, output: presenter)
        let indicatorUseCase = IndicatorUseCase(output: presenter)
        let controller = LocationAddController(useCaseInput: useCase, indicatorUseCaseInput: indicatorUseCase)
        let view = LocationAddView(lat: lat, lng: lng, controller: controller, viewModel: viewModel)

        return view
    }
}
