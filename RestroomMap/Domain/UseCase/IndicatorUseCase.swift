//
//  IndicatorUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import Foundation


protocol IndicatorUseCaseInput {
    func showIndicator()
    func hideIndicator()
}


protocol IndicatorUseCaseOutput {
    func showIndicatorView()
    func hideIndicatorView()
}


final class IndicatorUseCase: IndicatorUseCaseInput {
    private let indicatorOutput: IndicatorUseCaseOutput


    init(indicatorOutput: IndicatorUseCaseOutput) {
        self.indicatorOutput = indicatorOutput
    }


    func showIndicator() {
        indicatorOutput.showIndicatorView()
    }


    func hideIndicator() {
        indicatorOutput.hideIndicatorView()
    }
}
