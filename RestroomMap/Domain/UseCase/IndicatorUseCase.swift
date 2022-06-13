//
//  IndicatorUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import Foundation


protocol IndicatorUseCaseInput {
    func show()
    func hide()
}


protocol IndicatorUseCaseOutput {
    func show()
    func hide()
}


final class IndicatorUseCase: IndicatorUseCaseInput {
    private let indicatorOutput: IndicatorUseCaseOutput


    init(indicatorOutput: IndicatorUseCaseOutput) {
        self.indicatorOutput = indicatorOutput
    }


    func show() {
        indicatorOutput.show()
    }


    func hide() {
        indicatorOutput.hide()
    }
}
