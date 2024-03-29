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
        try XCTSkipIf(true, "テストデータで保存するとfetch処理で取得できず失敗するのでスキップ")
        let request = LocationRequestToFirestore()
        let model = TestConst.locationAddInputModel

        do {
            try await request.save(model)
            print("Success location save.")
        } catch {
            XCTFail("Fail location save.")
        }
    }


    func test_fetch() async throws {
        let request = LocationRequestToFirestore()

        do {
            let result = try await request.fetch()
            XCTAssertNotNil(result)
        } catch {
            XCTFail("Fail location fetch.")
        }
    }


    func test_delete() async throws {
        try XCTSkipIf(true, "'documentId'をFirestoreから取得する必要があるのでスキップ")
        let request = LocationRequestToFirestore()
        let model = DocumentIdModel(id: TestConst.documentId)

        do {
            try await request.delete(model)
        } catch {
            XCTFail("Fail test deleteLocation.")
        }
    }
}
