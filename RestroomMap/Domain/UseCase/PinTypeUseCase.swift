//
//  PinTypeUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import Foundation


protocol PinTypeUseCaseInput {

}


protocol PinTypeUseCaseOutput {

}


final class PinTypeUseCase: PinTypeUseCaseInput {
    private let output: PinTypeUseCaseOutput

    init(output: PinTypeUseCaseOutput) {
        self.output = output
    }
}
