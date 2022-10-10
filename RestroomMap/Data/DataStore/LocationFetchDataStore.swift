//
//  LocationFetchDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation


protocol LocationFetchDataStoreInterface {
    func fetchLocation() async throws -> [LocationFetchOutputEntity]
}


final class LocationFetchDataStore: LocationFetchDataStoreInterface {
    private let request = LocationRequestToFirestore()

    func fetchLocation() async throws -> [LocationFetchOutputEntity] {
        do {
            let entity = try await request.fetch()
            return entity
        } catch {
            throw error
        }
    }
}
