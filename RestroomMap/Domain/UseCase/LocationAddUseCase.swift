//
//  LocationAddUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation

protocol LocationAddUseCaseInput {
    func addLocation(_ model: LocationAddInputModel) async
}


protocol LocationAddUseCaseOutput {
    func successAddLocation()
    func failAddLocation(_ status: FailAddLocationStatus)
}


final class LocationAddUseCase: LocationAddUseCaseInput {
    private let repository: LocationAddRepository
    private let output: LocationAddUseCaseOutput


    init(repository: LocationAddRepository, output: LocationAddUseCaseOutput) {
        self.repository = repository
        self.output = output
    }


    func addLocation(_ model: LocationAddInputModel) async {
        do {
            if !validLocationName(model.name) {
                output.failAddLocation(.inValidName)
                return
            }

            try await repository.saveLocation(model)
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
}
