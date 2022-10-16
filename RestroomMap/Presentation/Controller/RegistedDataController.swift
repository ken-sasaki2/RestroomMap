//
//  RegistedDataController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation


final class RegistedDataController {
    private let registedDataUseCaseInput: RegistedDataUseCaseInput
    private let locationDeleteUseCaseInput: LocationDeleteUseCaseInput
    private let indicatorUseCaseInput: IndicatorUseCaseInput


    init(registedDataUseCaseInput: RegistedDataUseCaseInput, locationDeleteUseCaseInput: LocationDeleteUseCaseInput, indicatorUseCaseInput: IndicatorUseCaseInput) {
        self.registedDataUseCaseInput = registedDataUseCaseInput
        self.locationDeleteUseCaseInput = locationDeleteUseCaseInput
        self.indicatorUseCaseInput = indicatorUseCaseInput
    }


    func getDeviceId() {
        registedDataUseCaseInput.getDeviceId()
    }


    func deleteLocation(_ documentId: String) {
        Task {
            let model = DocumentIdModel(id: documentId)
            await locationDeleteUseCaseInput.deleteLocation(model)
        }
    }


    func toggleIndicator() {
        indicatorUseCaseInput.toggleIndicator()
    }
}
