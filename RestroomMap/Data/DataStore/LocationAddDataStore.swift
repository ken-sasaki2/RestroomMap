//
//  LocationAddDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation


protocol LocationAddDataStoreInterface {
    func saveLocation(_ model: LocationAddInputModel)
}


final class LocationAddDataStore: LocationAddDataStoreInterface {
    private let request = LocationRequestToFirestore()

    
    func saveLocation(_ model: LocationAddInputModel) {
        request.save(model)
    }
}
