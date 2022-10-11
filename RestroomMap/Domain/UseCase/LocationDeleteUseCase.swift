//
//  LocationDeleteUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation

protocol LocationDeleteUseCaseInput {
    func deleteLocation(_ model: DocumentIdModel) async throws
}


protocol LocationDeleteUseCaseOutput {
    func successDeleteLocation()
    func failDeleteLocation()
}


final class LocationDeleteUseCase: LocationDeleteUseCaseInput {
    private let repository: LocationDeleteRepositoryInterface
    private let output: LocationDeleteUseCaseOutput


    init(repository: LocationDeleteRepositoryInterface, output: LocationDeleteUseCaseOutput) {
        self.repository = repository
        self.output = output
    }


    func deleteLocation(_ model: DocumentIdModel) async {
        do {
            try await repository.deleteLocation(model)
            output.successDeleteLocation()
        } catch {
            output.failDeleteLocation()
        }
    }
}
