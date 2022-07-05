//
//  MockLocationAddUseCaseOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/07/05.
//

import Foundation

final class MockLocationAddUseCaseOutput: LocationAddUseCaseOutput {

    var isSuccessAddLocationCalled = false
    func successAddLocation() {
        isSuccessAddLocationCalled = true
    }


    var isFailAddLocationCalled = false
    func failAddLocation(_ status: FailAddLocationStatus) {
        isFailAddLocationCalled = true
    }
}
