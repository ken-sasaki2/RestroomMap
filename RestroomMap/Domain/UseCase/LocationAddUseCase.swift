//
//  LocationAddUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation

protocol LocationAddUseCaseInput {
    func saveLocation(_ model: LocationAddInputModel) async
}


protocol LocationAddUseCaseOutput {
    func successSaveLocation()
    func failSaveLocation()
    func inValidLocationName()
}


final class LocationAddUseCase: LocationAddUseCaseInput {
    private let repository: LocationAddRepository
    private let output: LocationAddUseCaseOutput


    init(repository: LocationAddRepository, output: LocationAddUseCaseOutput) {
        self.repository = repository
        self.output = output
    }


    func saveLocation(_ model: LocationAddInputModel) async {
        do {
            if !validLocationName(model.name) {
                output.inValidLocationName()
                return
            }

            try await repository.saveLocation(model)
            output.successSaveLocation()
            return
        } catch {
            output.failSaveLocation()
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
