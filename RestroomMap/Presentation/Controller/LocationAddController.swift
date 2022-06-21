//
//  LocationAddController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/19.
//

import Foundation


final class LocationAddController {
    private let useCaseInput: LocationAddUseCaseInput


    init(useCaseInput: LocationAddUseCaseInput) {
        self.useCaseInput = useCaseInput
    }

    func onAddButtonTapped(name: String, isOpen24Hour: Bool, openDate: Date, closeDate: Date, holiday: String?, isWesternStyle: Bool, isJapaneseStyle: Bool, isPublic: Bool, isByGender: Bool, isWashlet: Bool, isMultipurpose: Bool, isWheelchair: Bool, isDiaper: Bool, isBed: Bool, isPowderRoom: Bool, isParking: Bool, memo: String?) {

        let model = LocationAddInputModel(
            name: name,
            isOpen24Hour: isOpen24Hour,
            openDate: openDate.timeIntervalSince1970,
            closeDate: closeDate.timeIntervalSince1970,
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

        useCaseInput.saveLocation(model)
    }
}
