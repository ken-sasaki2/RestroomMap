//
//  LocationRequestToFirestoreTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/21.
//

import XCTest

class LocationRequestToFirestoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_save() async throws {
        let request = LocationRequestToFirestore()
        let model = TestConst.locationAddInputModel

        do {
            try await request.save(model)
            print("Success location save.")
        } catch {
            XCTFail("Fail location save.")
        }
    }
}
