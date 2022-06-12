//
//  MapViewBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

final class MapViewBuilder {
    static let shared = MapViewBuilder()

    private init() {}

    func build() -> MapView {
        let viewModel = MapViewModel()
        let presenter = MapPresenter(viewModel: viewModel)

        let mapDataStore = MapDataStore()
        let mapRepository = MapRepository(dataStore: mapDataStore)
        let locatePermissionDataStore = LocatePermissionDataStore()
        let locatePermissionRepository = LocatePermissionRepository(dataStore: locatePermissionDataStore)

        let mapUseCaseInput = MapUseCase(output: presenter, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)
        let indicatorUseCaseInput = IndicatorUseCase(indicatorOutput: presenter)

        let controller = MapController(mapUseCaseInput: mapUseCaseInput, indicatorUseCaseInput: indicatorUseCaseInput)

        let view = MapView(viewModel: viewModel, controller: controller)

        return view
    }
}
