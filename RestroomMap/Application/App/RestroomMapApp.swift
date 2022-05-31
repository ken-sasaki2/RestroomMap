//
//  RestroomMapApp.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/10.
//

import SwiftUI

@main
struct RestroomMapApp: App {
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate
    @StateObject private var rootViewModel = RootViewModel.shared

    var body: some Scene {
        WindowGroup {
            switch rootViewModel.rootView {
            case .location:
                LocatePermissionViewBuilder.shared.build()
            case .tracking:
                ATTPermissionViewBuilder.shared.build()
            case .map:
                MapViewBuilder.shared.build()
            }
        }
    }
}
