//
//  LocationAddController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/19.
//

import Foundation


final class LocationAddController {
    private let useCaseInput: LocationAddUseCaseInput
    private let indicatorUseCaseInput: IndicatorUseCaseInput


    init(useCaseInput: LocationAddUseCaseInput, indicatorUseCaseInput: IndicatorUseCaseInput) {
        self.useCaseInput = useCaseInput
        self.indicatorUseCaseInput = indicatorUseCaseInput
    }

    func onAddButtonTapped(lat: Double, lng: Double, name: String, isOpen24Hour: Bool, openDate: Date, closeDate: Date, holiday: String?, isWesternStyle: Bool, isJapaneseStyle: Bool, isPublic: Bool, isByGender: Bool, isWashlet: Bool, isMultipurpose: Bool, isWheelchair: Bool, isDiaper: Bool, isBed: Bool, isPowderRoom: Bool, isParking: Bool, memo: String?) {

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone.init(identifier: "Asia/Tokyo")
        let open = formatter.string(from: openDate)
        let close = formatter.string(from: closeDate)

        let model = LocationAddInputModel(
            lat: lat,
            lng: lng,
            name: name,
            isOpen24Hour: isOpen24Hour,
            openDate: open,
            closeDate: close,
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
            memo: memo
        )

        Task {
            await useCaseInput.saveLocation(model)
        }
    }


    func showIndicator() {
        indicatorUseCaseInput.toggleIndicator()
    }
}

// 登録ボタンタップでIndicator表示
// 登録完了でモーダル閉じる
// テスト書く
