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
        let locationAddDataStore = LocationAddDataStore()
        let userDataStore = UserDataStore()
        let locationAddRepository = LocationAddRepository(dataStore: locationAddDataStore)
        let userRepository = UserRepository(dataStore: userDataStore)

        let viewModel = LocationAddViewModel()
        let presenter = LocationAddPresenter(viewModel: viewModel)
        let useCase = LocationAddUseCase(repository: locationAddRepository, output: presenter, userRepository: userRepository)
        let indicatorUseCase = IndicatorUseCase(output: presenter)
        let controller = LocationAddController(useCaseInput: useCase, indicatorUseCaseInput: indicatorUseCase)
        let view = LocationAddView(lat: lat, lng: lng, controller: controller, viewModel: viewModel)

        return view
    }
}
