//
//  LocationAddInputModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation

struct LocationAddInputModel {
    var name: String
    var isOpen24Hour: Bool
    var openDate: Double
    var closeDate: Double
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
}
