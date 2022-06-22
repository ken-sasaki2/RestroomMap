//
//  IndicatorUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import Foundation


protocol IndicatorUseCaseInput {
    func toggleIndicator()
}


protocol IndicatorUseCaseOutput {
    func toggleIndicator()
}


final class IndicatorUseCase: IndicatorUseCaseInput {
    private let output: IndicatorUseCaseOutput


    init(output: IndicatorUseCaseOutput) {
        self.output = output
    }


    func toggleIndicator() {
        output.toggleIndicator()
    }
}
