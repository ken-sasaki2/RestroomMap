//
//  MockLocationAddUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/28.
//

import Foundation

final class MockLocationAddUseCase: LocationAddUseCaseInput {

    var isAddLocationCalled = false
    func addLocation(_ model: LocationAddInputModel) async {
        isAddLocationCalled = true
    }
}
