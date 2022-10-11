//
//  LocationDeleteRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation

protocol LocationDeleteRepositoryInterface {
    func deleteLocation(_ model: DocumentIdModel) async throws
}


final class LocationDeleteRepository: LocationDeleteRepositoryInterface {
    private let dataStore: LocationDeleteDataStoreInterface


    init(dataStore: LocationDeleteDataStoreInterface) {
        self.dataStore = dataStore
    }


    func deleteLocation(_ model: DocumentIdModel) async throws {
        do {
            try await dataStore.deleteLocation(model)
        } catch {
            throw error
        }
    }
}
