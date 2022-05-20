//
//  CurrentLocationModelTranslator.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

final class CurrentLocationModelTranslator {

    static func translate(entity: CurrentLocationEntity) -> CurrentLocationModel {
        let model = CurrentLocationModel(
            lat: entity.lat,
            lng: entity.lng
        )

        return model
    }
}
