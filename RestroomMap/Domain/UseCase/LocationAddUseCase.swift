//
//  LocationAddUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation

protocol LocationAddUseCaseInput {
    func addLocation(_ model: LocationAddInputModel) async
    func getDeviceId()
}


protocol LocationAddUseCaseOutput {
    func successAddLocation()
    func failAddLocation(_ status: FailAddLocationStatus)
    func setDeviceId(_ model: DeviceIdModel)
}


final class LocationAddUseCase: LocationAddUseCaseInput {
    private let repository: LocationAddRepositoryInterface // refactorTODO: 命名明確に
    private let userRepository: UserRepositoryInterface
    private let output: LocationAddUseCaseOutput


    init(repository: LocationAddRepositoryInterface, output: LocationAddUseCaseOutput, userRepository: UserRepositoryInterface) {
        self.repository = repository
        self.userRepository = userRepository
        self.output = output
    }


    func addLocation(_ model: LocationAddInputModel) async {
        do {
            if !validLocationName(model.name) {
                output.failAddLocation(.inValidName)
                return
            }

            try await repository.addLocation(model)
            output.successAddLocation()
            return
        } catch {
            output.failAddLocation(.error)
            return
        }
    }


    func validLocationName(_ name: String) -> Bool {
        let isMin = name.count < 2

        if isMin {
            return false
        } else {
            return true
        }
    }


    func getDeviceId() {
        guard let entity = userRepository.getDeviceId() else {
            return
        }
        let model = DeviceIdModelTranslator.translate(entity)

        output.setDeviceId(model)
    }
}
