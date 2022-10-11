//
//  RegistedDataViewBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation

final class RegistedDataViewBuilder {
    static let shared = RegistedDataViewBuilder()

    private init() {}

    func build(_ outputModel: LocationFetchOutputModel) -> RegistedDataView {
        let viewModel = RegistedDataViewModel()
        let presenter = RegistedDataPresenter(viewModel: viewModel)

        let dataStore = UserDataStore()
        let locationDeleteDataStore = LocationDeleteDataStore()

        let repository = UserRepository(dataStore: dataStore)
        let locationDeleteRepository = LocationDeleteRepository(dataStore: locationDeleteDataStore)

        let registedDataUseCaseInput = RegistedDataUseCase(repository: repository, output: presenter)
        let locationDeleteUseCase = LocationDeleteUseCase(repository: locationDeleteRepository, output: presenter)
        let indicatorUseCase = IndicatorUseCase(output: presenter)

        let controller = RegistedDataController(registedDataUseCaseInput: registedDataUseCaseInput, locationDeleteUseCase: locationDeleteUseCase, indicatorUseCaseInput: indicatorUseCase)

        let view = RegistedDataView(viewModel: viewModel, controller: controller, outputModel: outputModel)

        return view
    }
}
