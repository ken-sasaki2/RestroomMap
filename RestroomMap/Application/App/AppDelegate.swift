//
//  AppDelegate.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/12.
//

import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let controller = ApplicationBuilder.shared.build()
        controller.saveLaunchCount()

        return true
    }
}
