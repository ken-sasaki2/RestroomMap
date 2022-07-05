//
//  MockLocationAddDataStore.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/07/05.
//

import Foundation

final class MockLocationAddDataStore: LocationAddDataStoreInterface {

    var isAddLocationCalled = false
    func addLocation(_ model: LocationAddInputModel) async throws {
        isAddLocationCalled = true
    }
}
