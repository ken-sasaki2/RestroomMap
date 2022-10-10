//
//  LocationFetchRepositoryTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/10/10.
//

import XCTest

class LocationFetchRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_fetchLocation() async throws {
        let dataStore = MockLocationFetchDataStore()
        let repository = LocationFetchRepository(dataStore: dataStore)

        do {
            let entity = try await repository.fetchLocation()
            XCTAssertEqual(dataStore.isFetchLocationCalled, true)
            XCTAssert(entity.count != 0)
        } catch {
            XCTAssertEqual(dataStore.isFetchLocationCalled, true)
            XCTFail("Fail fetch location.")
        }
    }
}
