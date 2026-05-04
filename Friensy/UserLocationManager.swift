//
//  UserLocation.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/21/26.
//

import Foundation
import CoreLocation
import MapKit
import Combine


class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var state: AppStateManager
    @Published var locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    
    @Published var city = ""
    @Published var zip = ""
    
    init(state: AppStateManager) {
        self.state = state
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if !ProcessInfo.processInfo.environment.keys.contains("XCODE_RUNNING_FOR_PREVIEWS") {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location.coordinate
        
        let lat = location.coordinate.latitude
        
        DispatchQueue.main.async {
            
            self.state.state.latitude = lat
            
            self.state.state.currentSeason = SeasonManager.season(latitude: lat)
        }
        
        // don't run geocoder in preview
        guard !ProcessInfo.processInfo.environment.keys.contains("XCODE_RUNNING_FOR_PREVIEWS") else {
            return
        }
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, _ in
            if let placemark = placemarks?.first {
                DispatchQueue.main.async {
                    self.city = placemark.locality ?? "Unknown City"
                    self.zip = placemark.postalCode ?? "Unknown ZIP"
                }
            }
        }
    }
}
