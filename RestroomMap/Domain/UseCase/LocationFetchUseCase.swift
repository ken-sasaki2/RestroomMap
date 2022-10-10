//
//  LocationFetchUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation

protocol LocationFetchUseCaseInput {
    func fetchLocation() async
}


protocol LocationFetchUseCaseOutput {
    func successFetchLocation(_ model: [LocationFetchOutputModel])
    func failFetchLocation()
}


final class LocationFetchUseCase: LocationFetchUseCaseInput {
    private let repositorty: LocationFetchRepositoryInterface
    private let output: LocationFetchUseCaseOutput


    init(repositorty: LocationFetchRepositoryInterface, output: LocationFetchUseCaseOutput) {
        self.repositorty = repositorty
        self.output = output
    }


    func fetchLocation() async {
        do {
            let entity = try await repositorty.fetchLocation()
            let model = LocationFetchOutputModelTranslator.translate(entity)

            output.successFetchLocation(model)
        } catch {
            output.failFetchLocation()
        }
    }
}
