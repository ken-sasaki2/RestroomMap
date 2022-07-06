//
//  AppDelegate.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/12.
//

import SwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        firebaseConfigure()
        let controller = ApplicationBuilder.shared.build()
        controller.saveLaunchCount()
        controller.actionPerFirstLaunchIfCan()

        return true
    }


    private func firebaseConfigure() {
        #if DEBUG
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-Debug", ofType: "plist")
        #else
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-Release", ofType: "plist")
        #endif

        guard let filePath = filePath else {
            return
        }
        guard let options = FirebaseOptions(contentsOfFile: filePath) else {
            return
        }

        print("filePath:", filePath)
        print("options:", options)

        FirebaseApp.configure(options: options)
    }
}
