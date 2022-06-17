//
//  UserRepositoryTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/17.
//

import XCTest

class UserRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_saveLocation() throws {
        let dataStore = MockUserDataStore()
        let repository = UserRepository(dataStore: dataStore)

        let entity = CurrentLocationEntity(lat: TestConst.lat, lng: TestConst.lng)
        repository.saveLocation(entity: entity)
        XCTAssertEqual(dataStore.isSaveLocationCalled, true)
    }


    func test_saveLaunchCount() throws {
        let dataStore = MockUserDataStore()
        let repository = UserRepository(dataStore: dataStore)

        repository.saveLaunchCount()
        XCTAssertEqual(dataStore.isSaveLaunchCountCalled, true)
    }


    func test_getLaunchCount() throws {
        let dataStore = MockUserDataStore()
        let repository = UserRepository(dataStore: dataStore)

        let result = repository.getLaunchCount()
        XCTAssertEqual(result.launchCount, 1)
    }
}
