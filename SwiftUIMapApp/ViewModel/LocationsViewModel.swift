//
//  LocationsViewModel.swift
//  SwiftUIMapApp
//
//  Created by Mac on 4/4/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel : ObservableObject {
    
    @Published var locations : [Location]
    @Published var mapLocation : Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapregion : MKCoordinateRegion = MKCoordinateRegion ()
    @Published var locationsList : Bool = false
    @Published var showPreview : Location? = nil 
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init () {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
   private func updateMapRegion (location : Location) {
        withAnimation(.easeInOut) {
            mapregion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
       
    }
    
    func showLocationsList () {
        withAnimation(.easeInOut) {
            locationsList.toggle()
        }
    }
    
    func showNextLocation (location : Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            locationsList = false
        }
    }
    
    func nextButtonPressed () {
        
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {return}
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
}
