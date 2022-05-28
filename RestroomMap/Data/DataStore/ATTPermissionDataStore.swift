//
//  ATTPermissionDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/28.
//

import AppTrackingTransparency


protocol ATTPermissionDataStoreInterface {
    func getAuthorizationStatus() -> ATTAuthorizationStatusEntity
    func requestAuthorization() async
}


final class ATTPermissionDataStore: ATTPermissionDataStoreInterface {
    var statusEntity: ATTAuthorizationStatusEntity = .unknown


    func getAuthorizationStatus() -> ATTAuthorizationStatusEntity {
        let  status = ATTrackingManager.trackingAuthorizationStatus

        switch status {
        case .notDetermined:
            statusEntity = .notDetermined
        case .restricted:
            statusEntity = .restricted
        case .denied:
            statusEntity = .denied
        case .authorized:
            statusEntity = .authorized
        @unknown default:
            statusEntity = .unknown
        }

        return statusEntity
    }


    func requestAuthorization() async {
        return await withCheckedContinuation { continuation in
            ATTrackingManager.requestTrackingAuthorization { _ in
                continuation.resume(returning: ())
            }
        }
    }
}
