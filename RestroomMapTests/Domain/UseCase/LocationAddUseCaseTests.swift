//
//  LocationAddUseCaseTests.swift
//  RestroomMapTests
//
//  Created by sasaki.ken on 2022/07/05.
//

import XCTest

class LocationAddUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_addLocation_successAddLocationが呼ばれる() async throws {
        let locationAddRepository = MockLocationAddRepository()
        let userRepository = MockUserRepository()
        let output = MockLocationAddUseCaseOutput()
        let useCase = LocationAddUseCase(repository: locationAddRepository, output: output, userRepository: userRepository)

        await useCase.addLocation(TestConst.locationAddInputModel)
        XCTAssertEqual(output.isSuccessAddLocationCalled, true)
    }


    func test_addLocation_failAddLocationが呼ばれる() async throws {
        let locationAddRepository = MockLocationAddRepository()
        let userRepository = MockUserRepository()
        let output = MockLocationAddUseCaseOutput()
        let useCase = LocationAddUseCase(repository: locationAddRepository, output: output, userRepository: userRepository)
        let model = LocationAddInputModel(
            lat: TestConst.lat,
            lng: TestConst.lng,
            name: "x",
            isOpen24Hour: false,
            openDate: "11:00",
            closeDate: "23:00",
            holiday: "水曜日がお休み",
            isWesternStyle: false,
            isJapaneseStyle: false,
            isPublic: false,
            isByGender: false,
            isWashlet: false,
            isMultipurpose: false,
            isWheelchair: false,
            isDiaper: false,
            isBed: false,
            isPowderRoom: false,
            isParking: false,
            memo: nil,
            deviceId: TestConst.deviceId
        )

        await useCase.addLocation(model)
        XCTAssertEqual(output.isFailAddLocationCalled, true)
    }

    func test_validLocationName_引数の文字数が2未満の場合() throws {
        let locationAddRepository = MockLocationAddRepository()
        let userRepository = MockUserRepository()
        let output = MockLocationAddUseCaseOutput()
        let useCase = LocationAddUseCase(repository: locationAddRepository, output: output, userRepository: userRepository)

        let result = useCase.validLocationName("x")
        XCTAssertEqual(result, false)
    }


    func test_validLocationName_引数の文字数が2以上の場合() throws {
        let locationAddRepository = MockLocationAddRepository()
        let userRepository = MockUserRepository()
        let output = MockLocationAddUseCaseOutput()
        let useCase = LocationAddUseCase(repository: locationAddRepository, output: output, userRepository: userRepository)

        let result = useCase.validLocationName("xx")
        XCTAssertEqual(result, true)
    }


    func test_getDeviceId() throws {
        let locationAddRepository = MockLocationAddRepository()
        let userRepository = MockUserRepository()
        let output = MockLocationAddUseCaseOutput()
        let useCase = LocationAddUseCase(repository: locationAddRepository, output: output, userRepository: userRepository)

        useCase.getDeviceId()
        XCTAssertEqual(userRepository.isGetDeviceIdCalled, true)
        XCTAssertEqual(output.isSetDeviceIdCalled, true)
    }
}
