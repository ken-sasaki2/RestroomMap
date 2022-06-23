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


    func successSaveLocation() {
        toggleIndicator()
        viewModel.isShowSuccessSaveLocationAlert = true
    }


    func failSaveLocation() {
        toggleIndicator()
        viewModel.isShowFailSaveLocationAlert = true
    }


    func inValidLocationName() {
        toggleIndicator()
        viewModel.isShowInValidLocationNameAlert = true
    }
}


extension LocationAddPresenter: IndicatorUseCaseOutput {
    func toggleIndicator() {
        viewModel.isShowIndicatorView.toggle()
    }
}
