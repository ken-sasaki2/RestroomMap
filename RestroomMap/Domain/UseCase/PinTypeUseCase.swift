//
//  PinTypeUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import Foundation


protocol PinTypeUseCaseInterface {

}


final class PinTypeUseCase: PinTypeUseCaseInterface {
    private let presenter: MenuPresenter

    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }
}