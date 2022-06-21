//
//  LocationAddRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation


protocol LocationAddRepositoryInterface {
    func saveLocation(_ model: LocationAddInputModel)
}


final class LocationAddRepository: LocationAddRepositoryInterface {
    private let dataStore: LocationAddDataStoreInterface


    init(dataStore: LocationAddDataStoreInterface) {
        self.dataStore = dataStore
    }


    func saveLocation(_ model: LocationAddInputModel) {
        dataStore.saveLocation(model)
    }
}
