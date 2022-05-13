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

    var body: some Scene {
        WindowGroup {
            MapView(lat: 35.651390, lng: 139.63679)
        }
    }
}
