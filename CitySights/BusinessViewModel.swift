//
//  BusinessViewModel.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/4/25.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessViewModel : NSObject , CLLocationManagerDelegate{
    var service = DataService()
    var businesses = [Business]()
    var selectedBusiness : Business?
    var locationManager = CLLocationManager()
    var currentUserLocation : CLLocationCoordinate2D?
    var dummyLocation = CLLocationCoordinate2D(latitude: 40.7580, longitude: 73.9855)
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses(query : String?, options: String?, category : String?) {
        Task{
            businesses = await service.businessSearch(coordinate: currentUserLocation ?? dummyLocation, query: query, options: options, category: category)
        }
    }
    
    func checkAuthorizationAndRequestLocation(){
        //Check if we have permission
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse{
            currentUserLocation = nil
            locationManager.requestLocation()
        }
        // Request permission, if we don't have it already
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //Detect if user allowed, then request location
        if manager.authorizationStatus == .authorizedWhenInUse{
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        if currentUserLocation == nil{
            currentUserLocation = locations.last?.coordinate
            // Call Business Search
            getBusinesses(query: nil, options: nil, category: nil)
        }
        manager.stopUpdatingLocation()
    }
}
