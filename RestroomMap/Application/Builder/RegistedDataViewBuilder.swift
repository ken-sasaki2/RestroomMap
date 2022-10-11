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
        let repository = UserRepository(dataStore: dataStore)

        let useCase = RegistedDataUseCase(repository: repository, output: presenter)
        let controller = RegistedDataController(useCaseInput: useCase)

        let view = RegistedDataView(viewModel: viewModel, controller: controller, outputModel: outputModel)

        return view
    }
}
