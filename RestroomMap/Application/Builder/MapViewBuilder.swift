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

        let view = MapView(
            viewModel: viewModel,
            controller: MapController(
                mapUseCase: MapUseCase(
                    presenter: MapPresenter(
                        viewModel: viewModel
                    ),
                    mapRepository: MapRepository(
                        dataStore: MapDataStore()
                    ),
                    locatePermissionRepository: LocatePermissionRepository(
                        dataStore: LocatePermissionDataStore()
                    )
                ),
                userUseCase: UserUseCase(
                    repository: UserRepository(
                        dataStore: UserDataStore()
                    ),
                    mapPresenter: MapPresenter(
                        viewModel: MapViewModel()
                    )
                ),
                indicatorUseCase: IndicatorUseCase(
                    mapPresenter: MapPresenter(
                        viewModel: viewModel
                    )
                )
            ),
            lat: 35.65139,
            lng: 139.63679
        )

        return view
    }
}
