//
//  MockLocationFetchUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation


final class MockLocationFetchUseCase: LocationFetchUseCaseInput {

    var isFetchLocationCalled = false
    func fetchLocation() async {
        isFetchLocationCalled = true
    }
}
