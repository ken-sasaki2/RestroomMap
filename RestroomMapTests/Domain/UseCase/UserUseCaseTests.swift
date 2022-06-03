//
//  UserUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/06/03.
//

import XCTest

class UserUseCaseTests: XCTestCase {
    private var useCase: UserUseCase?

    override func setUpWithError() throws {
        useCase = UserUseCase(repository: UserRepository(dataStore: UserDataStore()), rootViewPresenter: RootViewPresenter())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_validFirstLaunch() throws {
        XCTContext.runActivity(named: "launchCountが1の場合") { _ in
            let entity = LaunchCountEntity(launchCount: 1)
            let result = useCase?.validFirstLaunch(entity: entity)

            XCTAssertEqual(result, true)
        }
        XCTContext.runActivity(named: "launchCountが1ではない場合") { _ in
            let entity = LaunchCountEntity(launchCount: 2)
            let result = useCase?.validFirstLaunch(entity: entity)

            XCTAssertEqual(result, false)
        }
    }
}
