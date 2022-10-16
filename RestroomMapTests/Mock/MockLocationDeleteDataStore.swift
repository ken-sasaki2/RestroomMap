//
//  MockLocationDeleteDataStore.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import Foundation


final class MockLocationDeleteDataStore: LocationDeleteDataStoreInterface {


    var isDeleteLocationCalled = false
    func deleteLocation(_ model: DocumentIdModel) async throws {
        isDeleteLocationCalled = true
    }
}
