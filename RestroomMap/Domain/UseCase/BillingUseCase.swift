//
//  BillingUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/21.
//

import Foundation

protocol BillingUseCaseInterface {

}


final class BillingUseCase: BillingUseCaseInterface {
    private let presenter: MenuPresenter

    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }
}
