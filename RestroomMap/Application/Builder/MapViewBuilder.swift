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
                useCase: MapUseCase(
                    presenter: MapPresenter(
                        viewModel: viewModel
                    ),
                    repository: MapRepository(
                        dataStore: MapDataStore()
                    )
                )
            ),
            lat: 35.65139,
            lng: 139.63679
        )

        return view
    }
}
