import Foundation
import CoreLocation
import UIKit

struct LocationData {
    let address: String
    let latitude: Double
    let longitude: Double
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    static let locationUpdateNotification = Notification.Name("locationUpdateNotification")

    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?

    override private init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        let authorizationStatus = CLLocationManager.authorizationStatus()

        switch authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            showAlertToOpenSettings()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }

    private func showAlertToOpenSettings() {
        guard let topController = UIApplication.shared.keyWindow?.rootViewController else { return }

        let alert = UIAlertController(title: "Location Permission Needed", message: "Location services are not enabled. Please enable them in settings.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))

        topController.present(alert, animated: true, completion: nil)
    }

    // CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLocation = location
       // locationManager.stopUpdatingLocation()

        // Reverse geocode to get the address
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            if let error = error {
                NotificationCenter.default.post(name: LocationManager.locationUpdateNotification, object: nil, userInfo: ["error": error])
                return
            }

            if let placemark = placemarks?.first {
                let address = "\(placemark.name ?? ""), \(placemark.locality ?? ""), \(placemark.isoCountryCode ?? "")"
                print(placemark)
                print("Address:",address)
                
                print("1:",placemark.administrativeArea)
                print("2:",placemark.areasOfInterest)
                print("3:",placemark.country)
                print("4:",placemark.inlandWater)
                print("5:",placemark.isoCountryCode)
                print("6:",placemark.locality)
                print("7:",placemark.name)
                print("8:",placemark.ocean)
                print("9:",placemark.postalCode)
                print("10:",placemark.region)
                print("11:",placemark.subLocality)
                print("12:",placemark.subThoroughfare)
                print("13:",placemark.thoroughfare)
                print("14:",placemark.timeZone)
                
                
                let locationData = LocationData(address: address, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                NotificationCenter.default.post(name: LocationManager.locationUpdateNotification, object: locationData)
                
                
                
            } else {
                let error = NSError(domain: "LocationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to retrieve address"])
                NotificationCenter.default.post(name: LocationManager.locationUpdateNotification, object: nil, userInfo: ["error": error])
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NotificationCenter.default.post(name: LocationManager.locationUpdateNotification, object: nil, userInfo: ["error": error])
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied || status == .restricted {
            showAlertToOpenSettings()
        }
    }
}
