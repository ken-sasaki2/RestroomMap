//
//  LocationAddViewModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/06/23.
//

import Foundation


final class LocationAddViewModel: ObservableObject {
    @Published var isShowIndicatorView = false
    @Published var isShowSuccessSaveLocationAlert = false
    @Published var isShowFailSaveLocationAlert = false
    @Published var isShowInValidLocationNameAlert = false
}
