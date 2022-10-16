//
//  MockRegistedDataUseCase.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import Foundation

final class MockRegistedDataUseCase: RegistedDataUseCaseInput {


    var isGetDeviceCalled = false
    func getDeviceId() {
        isGetDeviceCalled = true
    }
}
