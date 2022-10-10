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
        let locationFetchDataStore = LocationFetchDataStore()
        let locationFetchRepository = LocationFetchRepository(dataStore: locationFetchDataStore)

        let mapUseCaseInput = MapUseCase(output: presenter, mapRepository: mapRepository, locatePermissionRepository: locatePermissionRepository)
        let indicatorUseCaseInput = IndicatorUseCase(output: presenter)
        let locationFetchUseCaseInput = LocationFetchUseCase(repositorty: locationFetchRepository, output: presenter)

        let controller = MapController(mapUseCaseInput: mapUseCaseInput, indicatorUseCaseInput: indicatorUseCaseInput, locationFetchUseCaseInput: locationFetchUseCaseInput)

        let view = MapView(viewModel: viewModel, controller: controller)

        return view
    }
}
