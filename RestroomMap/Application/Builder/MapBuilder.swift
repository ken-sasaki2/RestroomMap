//
//  MapBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

final class MapBuilder {
    static let shared = MapBuilder()

    private init() {}

    func build() -> MapView {
        let mapViewModel = MapViewModel()

        let view = MapView(
            mapViewModel: mapViewModel,
            mapController: MapController(
                mapUseCase: MapUseCase(
                    mapPresenter: MapPresenter(
                        mapViewModel: mapViewModel
                    )
                )
            ),
            lat: 35.65139,
            lng: 139.63679
        )

        return view
    }
}
