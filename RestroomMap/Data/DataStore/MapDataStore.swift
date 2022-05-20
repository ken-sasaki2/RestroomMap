//
//  MapDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

protocol MapDataStoreInterface {
    func getCurrentLocationEntity() -> CurrentLocationEntity
}


final class MapDataStore: MapDataStoreInterface {
    private let userDefaults = UserDefaultsEntity()


    func getCurrentLocationEntity() -> CurrentLocationEntity {
        let lat = userDefaults.lat
        let lng = userDefaults.lng
        let entity = CurrentLocationEntity(lat: lat, lng: lng)

        return entity
    }
}
