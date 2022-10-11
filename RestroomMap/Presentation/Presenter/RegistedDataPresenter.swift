//
//  RegistedDataPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/11.
//

import Foundation


final class RegistedDataPresenter: RegistedDataUseCaseOutput {
    let viewModel: RegistedDataViewModel


    init(viewModel: RegistedDataViewModel) {
        self.viewModel = viewModel
    }


    func setDeviceId(_ model: DeviceIdModel) {
        viewModel.deviceId = model.deviceId
    }
}
