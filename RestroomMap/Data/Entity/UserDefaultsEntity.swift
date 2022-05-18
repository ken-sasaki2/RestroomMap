//
//  UserDefaultsEntity.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/18.
//

import Foundation

final class UserDefaultsEntity {

    private enum DefaultsKey: String {
        case lat
        case lng
    }


    private let defaults: UserDefaults = {
        UserDefaults.standard
    }()


    var lat: Double {
        get {
            defaults.double(forKey: DefaultsKey.lat.rawValue)
        } set {
            defaults.set(newValue, forKey: DefaultsKey.lat.rawValue)
        }
    }


    var lng: Double {
        get {
            defaults.double(forKey: DefaultsKey.lng.rawValue)
        } set {
            defaults.set(newValue, forKey: DefaultsKey.lng.rawValue)
        }
    }
}