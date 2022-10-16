//
//  MockLocationDeleteUseCaseOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import Foundation


final class MockLocationDeleteUseCaseOutput: LocationDeleteUseCaseOutput {


    var isSuccessDeleteLocationCalled = false
    func successDeleteLocation() {
        isSuccessDeleteLocationCalled = true
    }


    var isFailDeleteLocationCalled = false
    func failDeleteLocation() {
        isFailDeleteLocationCalled = true
    }
}
