//
//  LocationAddRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation


protocol LocationAddRepositoryInterface {
    func addLocation(_ model: LocationAddInputModel) async throws
}


final class LocationAddRepository: LocationAddRepositoryInterface {
    private let dataStore: LocationAddDataStoreInterface


    init(dataStore: LocationAddDataStoreInterface) {
        self.dataStore = dataStore
    }


    func addLocation(_ model: LocationAddInputModel) async throws {
        do {
            try await dataStore.addLocation(model)
        } catch {
            throw error
        }
    }
}
