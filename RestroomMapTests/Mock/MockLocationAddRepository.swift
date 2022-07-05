//
//  MockLocationAddRepository.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/07/05.
//

import Foundation

final class MockLocationAddRepository: LocationAddRepositoryInterface {

    var isAddLocationCalled = false
    func addLocation(_ model: LocationAddInputModel) async {
        isAddLocationCalled = true
    }
}
