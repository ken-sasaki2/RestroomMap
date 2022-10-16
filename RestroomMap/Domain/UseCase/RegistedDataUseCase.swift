//
//  RegistedDataUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation

protocol RegistedDataUseCaseInput {
    func getDeviceId()
}


protocol RegistedDataUseCaseOutput {
    func setDeviceId(_ model: DeviceIdModel)
}


final class RegistedDataUseCase: RegistedDataUseCaseInput {
    private let repository: UserRepositoryInterface
    private let output: RegistedDataUseCaseOutput


    init(repository: UserRepositoryInterface, output: RegistedDataUseCaseOutput) {
        self.repository = repository
        self.output = output
    }


    func getDeviceId() {
        guard let entity = repository.getDeviceId() else {
            return
        }
        let model = DeviceIdModelTranslator.translate(entity)

        output.setDeviceId(model)
    }
}
