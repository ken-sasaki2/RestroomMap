//
//  MockLocationFetchUseCaseOutput.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation


final class MockLocationFetchUseCaseOutput: LocationFetchUseCaseOutput {


    var isSuccessFetchLocationCalled = false
    func successFetchLocation(_ model: [LocationFetchOutputModel]) {
        isSuccessFetchLocationCalled = true
    }


    var isFailFetchLocationCalled = false
    func failFetchLocation() {
        isFailFetchLocationCalled = true
    }
}
