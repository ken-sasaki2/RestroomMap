//
//  LocationDeleteUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import XCTest

class LocationDeleteUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_deleteLocation() async throws {
        let repository = MockLocationDeleteRepository()
        let output = MockLocationDeleteUseCaseOutput()
        let useCase = LocationDeleteUseCase(repository: repository, output: output)
        let model = DocumentIdModel(id: TestConst.documentId)

        await useCase.deleteLocation(model)
        XCTAssertEqual(repository.isDeleteLocationCalled, true)
        XCTAssertEqual(output.isSuccessDeleteLocationCalled, true)
    }
}
