//
//  LocationAddPresenter.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/21.
//

import Foundation

final class LocationAddPresenter: LocationAddUseCaseOutput {
    private let viewModel: LocationAddViewModel


    init(viewModel: LocationAddViewModel) {
        self.viewModel = viewModel
    }


    func successAddLocation() {
        toggleIndicator()
        viewModel.isShowSuccessSaveLocationAlert = true
    }


    func failAddLocation(_ status: FailAddLocationStatus) {
        toggleIndicator()

        switch status {
        case .error:
            viewModel.isShowFailSaveLocationAlert = true
        case .inValidName:
            viewModel.isShowInValidLocationNameAlert = true
        }
    }
}


extension LocationAddPresenter: IndicatorUseCaseOutput {
    func toggleIndicator() {
        viewModel.isShowIndicatorView.toggle()
    }
}
