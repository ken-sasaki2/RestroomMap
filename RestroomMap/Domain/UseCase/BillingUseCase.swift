//
//  BillingUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import Foundation

protocol BillingUseCaseInput {

}


protocol BillingUseCaseOutput {

}


final class BillingUseCase: BillingUseCaseInput {
    private let output: BillingUseCaseOutput

    init(output: BillingUseCaseOutput) {
        self.output = output
    }
}
