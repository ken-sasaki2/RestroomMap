//
//  MenuUseCase.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

protocol MenuUseCaseInterface {

}


final class MenuUseCase: MenuUseCaseInterface {
    private let presenter: MenuPresenterInterface

    init(presenter: MenuPresenterInterface) {
        self.presenter = presenter
    }
}
