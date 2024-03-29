//
//  TestConst.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/05/28.
//

import Foundation

struct TestConst {
    static let lat = 35.65139
    static let lng = 139.63679

    static let shareText = "test_shareText"
    static let shareUrl = "test_shareUrl"
    static let shareImage = "test_shareImage"

    static let deviceId = "xxxxx_xxxxx"
    static let documentId = "yyyyy_yyyyy"

    static let locationAddInputModel = LocationAddInputModel(
        lat: TestConst.lat,
        lng: TestConst.lng,
        name: "テスト",
        isOpen24Hour: false,
        openDate: "11:00",
        closeDate: "23:00",
        holiday: "水曜日がお休み",
        isWesternStyle: false,
        isJapaneseStyle: false,
        isPublic: false,
        isByGender: false,
        isWashlet: false,
        isMultipurpose: false,
        isWheelchair: false,
        isDiaper: false,
        isBed: false,
        isPowderRoom: false,
        isParking: false,
        memo: nil,
        deviceId: TestConst.deviceId
    )

    static let locationFetchOutputEntity = [
        LocationFetchOutputEntity(
            lat: TestConst.lat,
            lng: TestConst.lng,
            name: "テスト",
            isOpen24Hour: false,
            openDate: "11:00",
            closeDate: "23:00",
            holiday: "水曜日がお休み",
            isWesternStyle: false,
            isJapaneseStyle: false,
            isPublic: false,
            isByGender: false,
            isWashlet: false,
            isMultipurpose: false,
            isWheelchair: false,
            isDiaper: false,
            isBed: false,
            isPowderRoom: false,
            isParking: false,
            memo: nil,
            deviceId: TestConst.deviceId,
            documentId: TestConst.documentId
        )
    ]

    static let locationFetchOutputModel = [
        LocationFetchOutputModel(
            lat: TestConst.lat,
            lng: TestConst.lng,
            name: "テスト",
            isOpen24Hour: false,
            openDate: "11:00",
            closeDate: "23:00",
            holiday: "水曜日がお休み",
            isWesternStyle: true,
            isJapaneseStyle: true,
            isPublic: false,
            isByGender: false,
            isWashlet: false,
            isMultipurpose: false,
            isWheelchair: false,
            isDiaper: false,
            isBed: true,
            isPowderRoom: false,
            isParking: false,
            memo: "これはテストです。",
            deviceId: TestConst.deviceId,
            documentId: TestConst.documentId
        )
    ]
}
