//
//  RootViewModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/31.
//

import Foundation


final class RootViewModel: ObservableObject {
    @Published private(set) var rootView: RootViews = .map
    static let shared = RootViewModel()

    enum RootViews {
        case location
        case tracking
        case map
    }

    func changeRootView(rootView: RootViews) {
        self.rootView = rootView
    }
}
