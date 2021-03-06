//
//  LocationAddDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation


protocol LocationAddDataStoreInterface {
    func addLocation(_ model: LocationAddInputModel) async throws
}


final class LocationAddDataStore: LocationAddDataStoreInterface {
    private let request = LocationRequestToFirestore()


    func addLocation(_ model: LocationAddInputModel) async throws {
        do {
            try await request.save(model)
        } catch {
            throw error
        }
    }
}
