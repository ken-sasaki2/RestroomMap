//
//  MockLocationFetchDataStore.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation

final class MockLocationFetchDataStore: LocationFetchDataStoreInterface {

    var isFetchLocationCalled = false
    func fetchLocation() async throws -> [LocationFetchOutputEntity] {
        isFetchLocationCalled = true

        return TestConst.locationFetchOutputEntity
    }
}
