//
//  LocationFetchOutputModelTranslator.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation


final class LocationFetchOutputModelTranslator {

    static func translate(_ entity: [LocationFetchOutputEntity]) -> [LocationFetchOutputModel] {
        var model: [LocationFetchOutputModel] = []

        entity.forEach { entity in
            let data = LocationFetchOutputModel(
                lat: entity.lat,
                lng: entity.lng,
                name: entity.name,
                isOpen24Hour: entity.isOpen24Hour,
                openDate: entity.openDate,
                closeDate: entity.closeDate,
                holiday: entity.holiday,
                isWesternStyle: entity.isWesternStyle,
                isJapaneseStyle: entity.isJapaneseStyle,
                isPublic: entity.isPublic,
                isByGender: entity.isByGender,
                isWashlet: entity.isWashlet,
                isMultipurpose: entity.isMultipurpose,
                isWheelchair: entity.isWheelchair,
                isDiaper: entity.isDiaper,
                isBed: entity.isBed,
                isPowderRoom: entity.isPowderRoom,
                isParking: entity.isParking,
                memo: entity.memo,
                deviceId: entity.deviceId,
                documentId: entity.documentId
            )
            model.append(data)
        }

        return model
    }
}
