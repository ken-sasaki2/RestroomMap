//
//  MockLocationDeleteUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import Foundation


final class MockLocationDeleteUseCase: LocationDeleteUseCaseInput {

    var isDeleteLocationCalled = false
    func deleteLocation(_ model: DocumentIdModel) async {
        isDeleteLocationCalled = true
    }
}
