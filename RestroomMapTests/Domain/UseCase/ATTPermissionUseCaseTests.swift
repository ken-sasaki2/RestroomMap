//
//  ATTPermissionUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/14.
//

import XCTest

final class ATTPermissionUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_completeATTPermissionIfCan() async throws {
        let output = MockATTPermissionOutput()
        let repository = MockATTPermissionRepository()
        let useCase = ATTPermissionUseCase(output: output, repository: repository)

        await useCase.completeATTPermissionIfCan()
        XCTAssertEqual(repository.isGetAuthorizationStatusCalled, true)
        XCTAssertEqual(output.isCompleteATTPermissionCalled, true)
    }


    func test_actionPerStatus_statusがnotDeterminedの場合() async throws {
        let output = MockATTPermissionOutput()
        let repository = MockATTPermissionRepository()
        let useCase = ATTPermissionUseCase(output: output, repository: repository)

        await useCase.actionPerStatus(.notDetermined)
        XCTAssertEqual(repository.isRequestAuthorizationCalled, true)
        XCTAssertEqual(output.isCompleteATTPermissionCalled, true)
    }


    func test_actionPerStatus_statusがnotDeterminedではない場合() async throws {
        let output = MockATTPermissionOutput()
        let repository = MockATTPermissionRepository()
        let useCase = ATTPermissionUseCase(output: output, repository: repository)

        await useCase.actionPerStatus(.authorized)
        XCTAssertEqual(output.isCompleteATTPermissionCalled, true)
    }


    func test_requestAuthorization() async {
        let output = MockATTPermissionOutput()
        let repository = MockATTPermissionRepository()
        let useCase = ATTPermissionUseCase(output: output, repository: repository)

        await useCase.requestAuthorization()
        XCTAssertEqual(repository.isRequestAuthorizationCalled, true)
        XCTAssertEqual(output.isCompleteATTPermissionCalled, true)
    }
}
