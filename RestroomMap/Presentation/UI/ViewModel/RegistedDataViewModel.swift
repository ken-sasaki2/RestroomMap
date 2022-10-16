//
//  RegistedDataViewModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation

final class RegistedDataViewModel: ObservableObject {
    @Published var deviceId = ""
    @Published var successDeleteLocation = false
    @Published var failDeleteLocation = false
    @Published var isShowIndicatorView = false
}
