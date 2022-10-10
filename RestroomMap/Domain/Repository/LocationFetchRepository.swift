//
//  LocationFetchRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation


protocol LocationFetchRepositoryInterface {
    func fetchLocation() async throws -> [LocationFetchOutputEntity]
}


final class LocationFetchRepository: LocationFetchRepositoryInterface {
    private let dataStore: LocationFetchDataStoreInterface


    init(dataStore: LocationFetchDataStoreInterface) {
        self.dataStore = dataStore
    }


    func fetchLocation() async throws -> [LocationFetchOutputEntity] {
        do {
            let entity = try await dataStore.fetchLocation()
            return entity
        } catch {
            throw error
        }
    }
}
