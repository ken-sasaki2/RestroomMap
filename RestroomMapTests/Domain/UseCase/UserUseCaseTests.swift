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

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_getLaunchCount() throws {
        let output = MockUserUseCaseOutput()
        let repository = MockUserRepository()
        let useCase = UserUseCase(output: output, repository: repository)

        useCase.getLaunchCount()
        XCTAssertEqual(repository.isGetLaunchCountCalled, true)
        XCTAssertEqual(output.isShowLocatePermissionViewCalled, true)
    }


    func test_saveLocation() throws {
        let output = MockUserUseCaseOutput()
        let repository = MockUserRepository()
        let useCase = UserUseCase(output: output, repository: repository)

        useCase.saveLaunchCount()
        XCTAssertEqual(repository.isSaveLaunchCountCalled, true)
    }


    func test_validFirstLaunch_初回起動の場合() throws {
        let output = MockUserUseCaseOutput()
        let repository = MockUserRepository()
        let useCase = UserUseCase(output: output, repository: repository)
        let entity = LaunchCountEntity(launchCount: 1)

        let result = useCase.validFirstLaunch(entity: entity)
        XCTAssertEqual(result, true)
    }


    func test_validFirstLaunch_初回起動ではない場合() throws {
        let output = MockUserUseCaseOutput()
        let repository = MockUserRepository()
        let useCase = UserUseCase(output: output, repository: repository)
        let entity = LaunchCountEntity(launchCount: 2)

        let result = useCase.validFirstLaunch(entity: entity)
        XCTAssertEqual(result, false)
    }
}
