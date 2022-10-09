//
//  LocationRequestToFirestore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Firebase

final class LocationRequestToFirestore {
    private let reference = Firestore.firestore().collection("locations")


    func save(_ model: LocationAddInputModel) async throws {
        do {
            try await reference.document().setData([
                "lat": model.lat,
                "lng": model.lng,
                "name": model.name,
                "isOpen24Hour": model.isOpen24Hour,
                "openDate": model.openDate,
                "closeDate": model.closeDate,
                "holiday": model.holiday as Any,
                "isWesternStyle": model.isWesternStyle,
                "isJapaneseStyle": model.isJapaneseStyle,
                "isPublic": model.isPublic,
                "isByGender": model.isByGender,
                "isWashlet": model.isWashlet,
                "isMultipurpose": model.isMultipurpose,
                "isWheelchair": model.isWheelchair,
                "isDiaper": model.isDiaper,
                "isBed": model.isBed,
                "isPowderRoom": model.isPowderRoom,
                "isParking": model.isParking,
                "memo": model.memo as Any,
                "deviceId": model.deviceId
            ])
        } catch {
            throw error
        }
    }
}
