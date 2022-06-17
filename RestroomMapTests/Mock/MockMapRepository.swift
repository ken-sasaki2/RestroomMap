//
//  MockMapRepository.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import Foundation

final class MockMapRepository: MapRepositoryInterface {
    var entity: CurrentLocationEntity = CurrentLocationEntity(lat: TestConst.lat, lng: TestConst.lng)

    var isGetCurrentLocationEntityCalled = false
    func getCurrentLocationEntity() -> CurrentLocationEntity {
        isGetCurrentLocationEntityCalled = true

        return entity
    }
}
