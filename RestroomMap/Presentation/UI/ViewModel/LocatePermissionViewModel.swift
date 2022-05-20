//
//  LocatePermissionViewModel.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/16.
//

import SwiftUI

final class LocatePermissionViewModel: ObservableObject {
    @Published var isShowDeniedAlert = false
    @Published var doneLocatePermission = false
    @Published var isShowFailLocatePermissionAlert = false

    func openSettingPage() {
        let urlString = UIApplication.openSettingsURLString

        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
