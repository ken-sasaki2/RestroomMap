//
//  ShareUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import Foundation


protocol ShareUseCaseInput {
    func showShareSheetView(model: SharePostModel)
}


protocol ShareUseCaseOutput {
    func showShareSheetView(model: SharePostModel)
}


final class ShareUseCase: ShareUseCaseInput {
    private let output: ShareUseCaseOutput


    init(output: ShareUseCaseOutput) {
        self.output = output
    }


    func showShareSheetView(model: SharePostModel) {
        output.showShareSheetView(model: model)
    }
}
