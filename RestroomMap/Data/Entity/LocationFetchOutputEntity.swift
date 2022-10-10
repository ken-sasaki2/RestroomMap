//
//  LocationFetchOutputEntity.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation

struct LocationFetchOutputEntity {
    var lat: Double
    var lng: Double
    var name: String
    var isOpen24Hour: Bool
    var openDate: String
    var closeDate: String
    var holiday: String?
    var isWesternStyle: Bool
    var isJapaneseStyle: Bool
    var isPublic: Bool
    var isByGender: Bool
    var isWashlet: Bool
    var isMultipurpose: Bool
    var isWheelchair: Bool
    var isDiaper: Bool
    var isBed: Bool
    var isPowderRoom: Bool
    var isParking: Bool
    var memo: String?
    var deviceId: String
}
