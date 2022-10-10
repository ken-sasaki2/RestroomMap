//
//  LocationFetchUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/10.
//

import XCTest

class LocationFetchUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchLocation() async throws {
        let repository = MockLocationFetchRepository()
        let output = MockLocationFetchUseCaseOutput()
        let useCase = LocationFetchUseCase(repositorty: repository, output: output)

        await useCase.fetchLocation()
        XCTAssertEqual(repository.isFetchLocationCalled, true)
        XCTAssertEqual(output.isSuccessFetchLocationCalled, true)
    }
}
