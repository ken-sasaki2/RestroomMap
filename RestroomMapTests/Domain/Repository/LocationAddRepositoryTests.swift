//
//  LocationAddRepositoryTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/07/05.
//

import XCTest

class LocationAddRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_addLocation() async throws {
        let dataStore = MockLocationAddDataStore()
        let repository = LocationAddRepository(dataStore: dataStore)

        do {
            try await repository.addLocation(TestConst.locationAddInputModel)
            XCTAssertEqual(dataStore.isAddLocationCalled, true)
        } catch {
            XCTFail("Fail dataStore add location.")
        }
    }
}
