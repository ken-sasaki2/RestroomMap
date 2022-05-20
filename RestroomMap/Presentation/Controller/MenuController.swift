//
//  MenuController.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/20.
//

import Foundation

final class MenuController {
    private let useCase: MenuUseCaseInterface


    init(useCase: MenuUseCaseInterface) {
        self.useCase = useCase
    }
}
