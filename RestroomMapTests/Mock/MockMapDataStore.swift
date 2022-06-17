//
//  MockMapDataStore.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockMapDataStore: MapDataStoreInterface {

    func getCurrentLocationEntity() -> CurrentLocationEntity {
        let entity = CurrentLocationEntity(lat: TestConst.lat, lng: TestConst.lng)

        return entity
    }
}
