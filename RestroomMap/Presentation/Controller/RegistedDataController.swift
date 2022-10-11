//
//  RegistedDataController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation


final class RegistedDataController {
    private let registedDataUseCaseInput: RegistedDataUseCaseInput
    private let locationDeleteUseCase: LocationDeleteUseCase
    private let indicatorUseCaseInput: IndicatorUseCaseInput


    init(registedDataUseCaseInput: RegistedDataUseCaseInput, locationDeleteUseCase: LocationDeleteUseCase, indicatorUseCaseInput: IndicatorUseCaseInput) {
        self.registedDataUseCaseInput = registedDataUseCaseInput
        self.locationDeleteUseCase = locationDeleteUseCase
        self.indicatorUseCaseInput = indicatorUseCaseInput
    }


    func getDeviceId() {
        registedDataUseCaseInput.getDeviceId()
    }


    func deleteLocation(_ documentId: String) {
        Task {
            let model = DocumentIdModel(id: documentId)
            await locationDeleteUseCase.deleteLocation(model)
        }
    }


    func toggleIndicator() {
        indicatorUseCaseInput.toggleIndicator()
    }
}
