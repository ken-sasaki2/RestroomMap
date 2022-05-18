//
//  UserDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/18.
//

import Foundation

protocol UserDataStoreInterface {
    func saveLocation(entity: CurrentLocationEntity)
}


final class UserDataStore: UserDataStoreInterface {
    private let userDefaults = UserDefaultsEntity()
    

    func saveLocation(entity: CurrentLocationEntity) {
        userDefaults.lat = entity.lat
        userDefaults.lng = entity.lng
    }
}
