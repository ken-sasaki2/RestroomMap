//
//  LocatePermissionDataStore.swift
//  RestroomMap
//
//  Created by sasaki.ken on 2022/05/15.
//

import CoreLocation

protocol LocatePermissionDataStoreInterface {
    var delegate: LocatePermissionDataStoreDelegate? { get set }
    func getAuthorizationStatus() -> AuthorizationStatusEntity
    func requestWhenInUse(_ complication: @escaping (AuthorizationStatusEntity) -> Void)
    func startUpdatingLocation()
}

protocol LocatePermissionDataStoreDelegate: AnyObject {
    func didUpdatedLocation(_ entity: CurrentLocationEntity)
    func didFailWithError()
}


final class LocatePermissionDataStore: NSObject, LocatePermissionDataStoreInterface, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    var statusEntity: AuthorizationStatusEntity
    weak var delegate: LocatePermissionDataStoreDelegate?
    var callback: ((AuthorizationStatusEntity) -> Void)?

    override init() {
        locationManager = CLLocationManager()
        statusEntity = .unknown
        super.init()
        locationManager.delegate = self
    }


    func getAuthorizationStatus() -> AuthorizationStatusEntity {
        let status = statusEntity
        return status
    }


    func requestWhenInUse(_ complication: @escaping (AuthorizationStatusEntity) -> Void) {
        locationManager.requestWhenInUseAuthorization()
        callback = complication
    }


    func startUpdatingLocation() {
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
    }


    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus

        switch status {
        case .notDetermined:
            statusEntity = .notDetermined
        case .restricted:
            statusEntity = .restricted
        case .denied:
            statusEntity = .denied
        case .authorizedAlways:
            statusEntity = .authorizedAlways
        case .authorizedWhenInUse:
            statusEntity = .authorizedWhenInUse
        @unknown default:
            statusEntity = .unknown
        }

        callback?(statusEntity)
        callback = nil
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }

        let lat = Double(location.coordinate.latitude)
        let lng = Double(location.coordinate.longitude)
        print("latitude:", lat, "longitude:", lng)

        let entity = CurrentLocationEntity(lat: lat, lng: lng)

        delegate?.didUpdatedLocation(entity)
        locationManager.stopUpdatingLocation()
    }


    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.didFailWithError()
    }
}
