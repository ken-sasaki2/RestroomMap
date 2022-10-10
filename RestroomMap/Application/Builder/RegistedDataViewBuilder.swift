//
//  RegistedDataViewBuilder.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/10/10.
//

import Foundation

final class RegistedDataViewBuilder {
    static let shared = RegistedDataViewBuilder()

    private init() {}

    func build(_ outputModel: LocationFetchOutputModel) -> RegistedDataView {
        let view = RegistedDataView(outputModel: outputModel)

        return view
    }
}
