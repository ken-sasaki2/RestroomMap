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


    func fetch() async throws -> [LocationFetchOutputEntity] {
        let documents = try await reference.getDocuments(source: .default).documents
        var entity: [LocationFetchOutputEntity] = []

        for document in documents {
            let documentData = document.data()

            guard let lat = documentData["lat"] as? Double,
                  let lng = documentData["lng"] as? Double,
                  let name = documentData["name"] as? String,
                  let isOpen24Hour = documentData["isOpen24Hour"] as? Bool,
                  let openDate = documentData["openDate"] as? String,
                  let closeDate = documentData["closeDate"] as? String,
                  let holiday = documentData["holiday"] as? String,
                  let isWesternStyle = documentData["isWesternStyle"] as? Bool,
                  let isJapaneseStyle = documentData["isJapaneseStyle"] as? Bool,
                  let isPublic = documentData["isPublic"] as? Bool,
                  let isByGender = documentData["isByGender"] as? Bool,
                  let isWashlet = documentData["isWashlet"] as? Bool,
                  let isMultipurpose = documentData["isMultipurpose"] as? Bool,
                  let isWheelchair = documentData["isWheelchair"] as? Bool,
                  let isDiaper = documentData["isDiaper"] as? Bool,
                  let isBed = documentData["isBed"] as? Bool,
                  let isPowderRoom = documentData["isPowderRoom"] as? Bool,
                  let isParking = documentData["isParking"] as? Bool,
                  let memo = documentData["memo"] as? String,
                  let deviceId = documentData["deviceId"] as? String
            else {
                throw NSError(domain: "Fail fetch locations data.", code: -1)
            }

            let data = LocationFetchOutputEntity(
                lat: lat,
                lng: lng,
                name: name,
                isOpen24Hour: isOpen24Hour,
                openDate: openDate,
                closeDate: closeDate,
                holiday: holiday,
                isWesternStyle: isWesternStyle,
                isJapaneseStyle: isJapaneseStyle,
                isPublic: isPublic,
                isByGender: isByGender,
                isWashlet: isWashlet,
                isMultipurpose: isMultipurpose,
                isWheelchair: isWheelchair,
                isDiaper: isDiaper,
                isBed: isBed,
                isPowderRoom: isPowderRoom,
                isParking: isParking,
                memo: memo,
                deviceId: deviceId
            )

            entity.append(data)
        }

        return entity
    }
}
