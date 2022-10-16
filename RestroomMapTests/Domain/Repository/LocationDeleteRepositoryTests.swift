//
//  LocationDeleteRepositoryTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/16.
//

import XCTest

class LocationDeleteRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_deleteLocation() async throws {
        let dataStore = MockLocationDeleteDataStore()
        let repository = LocationDeleteRepository(dataStore: dataStore)
        let model = DocumentIdModel(id: TestConst.documentId)

        do {
            try await repository.deleteLocation(model)
            XCTAssertEqual(dataStore.isDeleteLocationCalled, true)
        } catch {
            XCTFail("Fail test deleteLocation.")
        }
    }
}
