//
//  LocationService.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import Foundation
import CoreLocation
import Combine

final class LocationService: NSObject {
    
    // MARK: - Properties
    static let shared = LocationService()
    
    private let locationManager: CLLocationManager
    
    private let locationSubject = PassthroughSubject<CLLocationCoordinate2D, Never>()
    private let errorSubject = PassthroughSubject<LocationError, Never>()
    
    // MARK: - Publishers
    var locationPublisher: AnyPublisher<CLLocationCoordinate2D, Never> {
        locationSubject.eraseToAnyPublisher()
    }
    
    var errorPublisher: AnyPublisher<LocationError, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    // MARK: - Init
    private override init() {
        self.locationManager = CLLocationManager()
        super.init()
        configureLocationManager()
    }
    
    // MARK: - Functions
    func start() {
        requestLocation()
    }
    
    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func requestLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied, .restricted:
            errorSubject.send(.permissionDenied)
        @unknown default:
            break
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else {
            errorSubject.send(.locationUnavailable)
            return
        }
        print("Location: \(coordinate.latitude), \(coordinate.longitude)")
        locationSubject.send(coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        errorSubject.send(.unknown(error))
        print("Failed to get location: \(error.localizedDescription)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
            print("Authorization Status: \(manager.authorizationStatus.rawValue)")

        case .denied, .restricted:
            errorSubject.send(.permissionDenied)
            print("Authorization Status: \(manager.authorizationStatus.rawValue)")

        default:
            break
        }
    }
}

//MARK: - ERROR ENUM
enum LocationError: Error {
    case permissionDenied
    case locationUnavailable
    case unknown(Error)
}

