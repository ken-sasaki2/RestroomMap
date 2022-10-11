//
//  RegistedDataController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation


final class RegistedDataController {
    private let useCaseInput: RegistedDataUseCaseInput


    init(useCaseInput: RegistedDataUseCaseInput) {
        self.useCaseInput = useCaseInput
    }


    func getDeviceId() {
        useCaseInput.getDeviceId()
    }
}
