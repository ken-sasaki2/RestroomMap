//
//  CurrentLocationEntity.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/17.
//

import Foundation

struct CurrentLocationEntity {
    var lat: Double
    var lng: Double

    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
}
