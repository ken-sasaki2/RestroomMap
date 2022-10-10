//
//  DeviceIdModelTranslator.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/09.
//

import Foundation

final class DeviceIdModelTranslator {

    static func translate(_ entity: DeviceIdEntity) -> DeviceIdModel {
        let model = DeviceIdModel(deviceId: entity.deviceId)

        return model
    }
}
