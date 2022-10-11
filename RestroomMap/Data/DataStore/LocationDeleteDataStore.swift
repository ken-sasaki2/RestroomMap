//
//  LocationDeleteDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation

protocol LocationDeleteDataStoreInterface {
    func deleteLocation(_ model: DocumentIdModel) async throws
}


final class LocationDeleteDataStore: LocationDeleteDataStoreInterface {
    private let request = LocationRequestToFirestore()


    func deleteLocation(_ model: DocumentIdModel) async throws {
        do {
            try await request.delete(model)
        } catch {
            throw error
        }
    }
}
