//
//  MapViewModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/14.
//

import Foundation

final class MapViewModel: ObservableObject {
    @Published var isShowMenuView = false
    @Published var isShowFocusView = false
    @Published var isShowAddLocationView = false
    @Published var currentLocation = CurrentLocationModel(lat: 0.0, lng: 0.0)
    @Published var isShowIndicatorView = false
    @Published var isShowLocationAlert = false
    @Published var locationFetchOutputModel: [LocationFetchOutputModel] = []
    @Published var isShowFetchLocationAlert = false
}
