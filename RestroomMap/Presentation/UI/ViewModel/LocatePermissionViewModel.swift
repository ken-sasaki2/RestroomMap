//
//  LocatePermissionViewModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/16.
//

import Foundation

final class LocatePermissionViewModel: ObservableObject {
    @Published var isShowDeniedAlert = false
    @Published var doneLocatePermission = false
    @Published var isShowFailLocatePermissionAlert = false
}
