//
//  UserRepository.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/18.
//

import Foundation

protocol UserRepositoryInterface {
    func saveLocation(entity: CurrentLocationEntity)
}


final class UserRepository: UserRepositoryInterface {
    private let dataStore: UserDataStoreInterface
    
    
    init(dataStore: UserDataStoreInterface) {
        self.dataStore = dataStore
    }
    

    func saveLocation(entity: CurrentLocationEntity) {
        dataStore.saveLocation(entity: entity)
    }
}
