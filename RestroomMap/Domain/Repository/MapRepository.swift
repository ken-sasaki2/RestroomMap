//
//  MapRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

protocol MapRepositoryInterface {
    func getCurrentLocationEntity() -> CurrentLocationEntity
}


final class MapRepository: MapRepositoryInterface {
    private let dataStore: MapDataStoreInterface


    init(dataStore: MapDataStoreInterface) {
        self.dataStore = dataStore
    }


    func getCurrentLocationEntity() -> CurrentLocationEntity {
        let entity = dataStore.getCurrentLocationEntity()

        return entity
    }
}
